{
  flake.nixosModules.signal = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.signal-desktop
    ];

    persistance.cache.directories = [
      ".config/Signal"
    ];
  };
}
