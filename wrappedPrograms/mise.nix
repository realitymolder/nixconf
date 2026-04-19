{
  inputs,
  ...
}: {
  perSystem = {pkgs, ...}: {
    packages.mise = inputs.wrappers.lib.wrapPackage {
      inherit pkgs;
      package = pkgs.mise;
    };
  };

  flake.wrappersModules.mise = inputs.wrappers.lib.wrapModule (
    {
      config,
      lib,
      ...
    }: {
      options = {};

      config = {
        env.MISE_SHELL = "fish";
      };
    }
  );
}