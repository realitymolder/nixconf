{inputs, ...}: {
  perSystem = {pkgs, ...}: {
    packages.pi-coding-agent = inputs.wrappers.lib.wrapPackage {
      inherit pkgs;
      package = pkgs.pi-coding-agent;
      runtimeInputs = [
        pkgs.nodejs_latest
      ];
      env = {
        NPM_CONFIG_PREFIX = "$HOME/.pi/npm/";
      };
    };
  };
}