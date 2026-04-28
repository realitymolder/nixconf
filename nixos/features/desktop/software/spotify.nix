{
  flake.nixosModules.spotify = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.spotify
    ];

    persistance.cache.directories = [
      ".config/spotify"
    ];
  };
}
