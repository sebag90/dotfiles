{pkgs, ...}: {
  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # # Enable the GNOME Desktop Environment.
  # services.displayManager.gdm.enable = true;
  # services.desktopManager.gnome.enable = true;

  # environment.gnome.excludePackages = with pkgs; [
  #   cheese      # photo booth
  #   epiphany    # web browser
  #   gedit       # text editor
  #   yelp        # help viewer
  # ];
  services.displayManager.cosmic-greeter.enable = true;

  # Enable the COSMIC desktop environment
  services.desktopManager.cosmic.enable = true;
}
