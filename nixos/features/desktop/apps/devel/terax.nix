{self, ...}: {
  flake.nixosModules.terax = {pkgs, ...}: let
    terax = pkgs.appimageTools.wrapType2 {
      name = "terax";
      src = pkgs.fetchurl {
        url = "https://github.com/crynta/terax-ai/releases/download/v0.5.9/Terax_0.5.9_amd64.AppImage";
        hash = "sha256-c/R2CvGDlw5jFPYVXUONl5qk9yyt9tNNgcr86qBhV7I=";
      };
    };
  in {
    environment.systemPackages = [terax];

    persistance.cache.directories = [
      ".config/terax"
    ];
  };
}
