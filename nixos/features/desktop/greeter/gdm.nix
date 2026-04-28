{
  flake.nixosModules.greeter_gdm = {pkgs, ...}: {
    services.displayManager.gdm.enable = true;
    services.displayManager.gdm.wayland = true;
  };
}
