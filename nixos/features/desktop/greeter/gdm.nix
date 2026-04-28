{
  flake.nixosModules.gdm = {pkgs, ...}: {
    services.displayManager.gdm.enable = true;
    services.displayManager.gdm.wayland = true;
  };
}
