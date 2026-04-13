{
  flake.nixosModules.migration-module = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.spotify
      pkgs.opencode
      pkgs.pi-coding-agent
      pkgs.anytype
      pkgs.zed-editor
      pkgs.vscode
    ];

    # persistance.cache.directories = [
    #   ".config/YouTube Music"
    # ];
  };
}
