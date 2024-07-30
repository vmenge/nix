{ pkgs, ... }: {

  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "intl";
    videoDrivers = [ "displaylink" "modesetting" ]; 

  };

  programs.light = {
    enable = true;
  };

  xdg.portal.wlr.enable = true;
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
