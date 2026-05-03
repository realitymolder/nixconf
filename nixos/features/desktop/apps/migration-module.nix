{self, ...}: {
  flake.nixosModules.migration-module = {pkgs, ...}: let
    selfpkgs = self.packages."${pkgs.stdenv.hostPlatform.system}";
  in {
    environment.systemPackages = [
      pkgs.spotify
      # pkgs.opencode
      # selfpkgs.pi-coding-agent
      pkgs.anytype
      pkgs.zed-editor
      pkgs.vscode
      pkgs.devenv
      pkgs.pixman
    ];

    # persistance.cache.directories = [
    #   ".config/YouTube Music"
    # ];
  };
}
