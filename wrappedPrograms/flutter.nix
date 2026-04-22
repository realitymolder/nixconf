{inputs, ...}: {
  perSystem = {pkgs, ...}: {
    packages.flutter-dev = inputs.wrappers.lib.wrapPackage {
      inherit pkgs;
      package = pkgs.flutter;
    };
  };
}