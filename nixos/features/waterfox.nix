{self, ...}: {
  flake.nixosModules.waterfox = {pkgs, ...}: {
    environment.systemPackages = [
      self.inputs.waterfox-flake.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

    persistance.data.directories = [
      ".waterfox"
    ];

    persistance.cache.directories = [
      ".cache/waterfox"
    ];
  };
}