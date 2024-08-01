{ pkgs, ... }: {

  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "intl";
    videoDrivers = [ "displaylink" "modesetting" ]; 
  };

  programs.light = {
    enable = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
  };

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };


  environment.loginShellInit = /*bash*/''
    if [[ "$(tty)" == /dev/tty1 ]]; then
      sway
    fi
  '';

}
