{
  flake.nixosModules.ai-editors = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.opencode
    ];

    # What is the diff betweeen ppersistance.data / ppersistance.cache ?
    persistance.cache.directories = [
      ".config/pi"
      ".config/opencode"
    ];
  };
}
