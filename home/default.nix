{ config, pkgs, ... }:

{
  imports = [ ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "vmenge";
  home.homeDirectory = "/home/vmenge";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    google-chrome
    oh-my-zsh
    i3blocks
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".zshrc".source = ../dotfiles/.zshrc;
    ".tmux.conf".source = ../dotfiles/.tmux.conf;

    ".cargo/config.toml".source = ../dotfiles/.cargo/config.toml;

    ".scripts".source = ../dotfiles/.scripts;
    ".scripts".recursive = true;

    ".ssh".source = ../dotfiles/.ssh;
    ".ssh".recursive = true;

    ".config/mimeapps.list".source = ../dotfiles/.config/mimeapps.list;

    ".config/alacritty".source = ../dotfiles/.config/alacritty;
    ".config/alacritty".recursive = true;

    ".config/nvim".source = ../dotfiles/.config/nvim;
    ".config/nvim".recursive = true;
    
    ".config/i3".source = ../dotfiles/.config/i3;
    ".config/i3".recursive = true;

    ".config/mako".source = ../dotfiles/.config/mako;
    ".config/mako".recursive = true;

    ".config/rofi".source = ../dotfiles/.config/rofi;
    ".config/rofi".recursive = true;

    ".config/sway".source = ../dotfiles/.config/sway;
    ".config/sway".recursive = true;

    ".config/zathura".source = ../dotfiles/.config/zathura;
    ".config/zathura".recursive = true;

    ".config/zed/keymap.json".source = ../dotfiles/.config/zed/keymap.json;
    ".config/zed/settings.json".source = ../dotfiles/.config/zed/settings.json;
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/vmenge/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    XDG_CURRENT_DESKTOP = "sway"; 
  };

  programs.git = {
    enable = true;
    userName = "vmenge";
    extraConfig = {
      credential.helper = "store"; 
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
