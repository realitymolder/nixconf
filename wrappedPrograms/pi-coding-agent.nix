{inputs, self, ...}: {
  flake.wrappersModules.picodingagent = inputs.wrappers.lib.wrapModule (
    {
      config,
      lib,
      ...
    }: {
      options = {};

      config = {};
    }
  );

  perSystem = {pkgs, ...}: {
    packages.pi-coding-agent =
      (self.wrappersModules.picodingagent.apply {
        inherit pkgs;
        package = pkgs.pi-coding-agent;
        extraPackages = [pkgs.nodejs_latest];
        env.NPM_CONFIG_PREFIX = "$HOME/.pi/npm/";
      }).wrapper;
  };
}