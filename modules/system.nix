{ pkgs, lib, ... }: {
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Configure console keymap
  console.keyMap = "us-acentos";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.vmenge = {
    isNormalUser = true;
    description = "Victor Menge";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" "docker" ];
    shell = pkgs.zsh;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # disable pulseaudio
  hardware.pulseaudio.enable = false;
  # enable realtime processing
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;

    # support alsa and pulseaudio
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    home-manager
    bash
    pciutils # A collection of programs for inspecting and manipulating configuration of PCI devices
    lsof # A tool to list open files
    wl-clipboard # stdin / stdout clipboard
    atool
    git
    fnm
    dotnet-sdk_8
    zed-editor
    brave
    tlrc # Command line client for tldr, a collection of simplified man pages.
    networkmanagerapplet # NetworkManager control applet
    stow # Manage installation of multiple softwares in the same directory tree
    acpilight # a backward-compatible xbacklight replacement based on ACPI
    rustup # Rust toolchain installer
    gcc # GNU Compiler Collection
    cmake # Cross-platform makefile build tool
    fnm # Node Version Manager
    unzip # Decompression program for .zip files
    zip # Compression program for .zip files
    wget # Network retriever
    xclip # Command line clipboard utility
    fd # Simple, fast and user-friendly alternative to 'find'
    fzf # Command-line fuzzy finder
    ripgrep # Line-oriented search tool
    alsa-utils # Utility for managing sound on Linux
    docker # Container platform
    docker-compose # Define and run multi-container applications with Docker
    docker-buildx # Docker plugin for building using BuildKit
    podman # Tool for managing OCI containers
    tmux # Terminal multiplexer
    alacritty # GPU-accelerated terminal emulator
    neovim # Vim-fork focused on extensibility and usability
    btop # Console-based system monitor
    yazi # Open source tool to show information on the terminal as a widget
    ueberzugpp # Image display tool for terminals
    pass # Password manager
    fftw # Computing library for Fourier transforms
    ncurses # Library for handling terminal capabilities
    cli-visualizer # Music visualizer for the terminal
    zig # General-purpose programming language
    zathura # Document viewer for PDF and other formats
    bat # Command line text viewer (pager) with syntax highlighting
    awscli2 # Command line interface for Amazon Web Services
    k9s # Kubernetes CLI To Manage Your Clusters In Style
    strace # Diagnostic and debugging tool
    kubectl # A command line tool for communicating with a Kubernetes API server
    rofi-wayland # A window switcher, application launcher and dmenu replacement
    neofetch # A CLI system information tool written in BASH that supports displaying images.
    mold # A modern linker
    asdf-vm # Extendable version manager with support for Ruby, Node.js, Elixir, Erlang & more
    p7zip # Command-line file archiver with high compression ratio
    protontricks # A simple wrapper that does winetricks things for Proton enabled games.
    steam
    gamemode # A daemon/lib combo that allows games to request a set of optimisations be temporarily applied to the host OS
    qemu
    pre-commit # A framework for managing and maintaining multi-language pre-commit hooks
    flameshot # Powerful yet simple to use screenshot software
    teleport # Modern SSH server for teams managing distributed infrastructure
    picocom # Minimal dumb-terminal emulation program, very much like minicom
    swayfx
    swaylock-effects # Screen locker for Wayland
    swww # Efficient animated wallpaper daemon for wayland, controlled at runtime
    file # A program that shows the type of files
    isort # A Python utility / library to sort Python imports
    black # The uncompromising Python code formatter
    zsh
    oh-my-zsh
    python3
    acpi # Show battery status and other ACPI information
    slack
    spotify
    postman
    mongodb-compass
    obsidian
    grim # screenshot
    slurp # select region and output to stdout
    pavucontrol
    pkg-config # A tool that allows packages to find out information about other packages (wrapper script)
    libsodium # A modern and easy-to-use crypto library
    mako # Notification system
    libnotify # Send notifications to notification daemon
    wdisplays # A graphical application for configuring displays in Wayland compositors
    zoom-us
    displaylink
    usbutils
    vagrant
  ];

  environment.variables.EDITOR = "nvim";
  
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      theme = "agnoster";
      plugins = [
        "git"
        "npm"
        "node"
        "rust"
        "deno"
      ];
    };
  };


  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.firefox = {
    enable = true;
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      # Add any missing dynamic libraries for unpackaged programs
      # here, NOT in environment.systemPackages
    ];
  };

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  fonts = {
    fontDir = {
      enable = true;
    };
  };


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  #
  services.devmon.enable = true;
  services.dbus.enable = true;
  services.avahi.enable = true;
}
