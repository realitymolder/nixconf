{self, lib, ...}: {
  flake.nixosModules.waterfox = {pkgs, ...}: {
    environment.systemPackages = [
      self.inputs.waterfox-flake.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

    xdg.mime.defaultApplications = {
      "application/x-extension-htm" = ["waterfox.desktop"];
      "text/html" = ["waterfox.desktop"];
      "x-scheme-handler/http" = ["waterfox.desktop"];
      "x-scheme-handler/https" = ["waterfox.desktop"];
      "x-scheme-handler/chrome" = ["waterfox.desktop"];
    };

    persistance.data.directories = [
      ".waterfox"
    ];

    persistance.cache.directories = [
      ".cache/waterfox"
    ];
  };
}