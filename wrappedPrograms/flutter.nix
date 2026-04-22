{inputs, ...}: {
  perSystem = {pkgs, ...}: {
    packages.flutter-dev = inputs.wrappers.lib.wrapPackage {
      inherit pkgs;
      package = pkgs.flutter;
      runtimeInputs = [
        pkgs.clang
        pkgs.cmake
        pkgs.ninja
        pkgs.pkg-config
        pkgs.gtk3
        pkgs.at-spi2-atk
        pkgs.libxkbcommon
        pkgs.unzip
        pkgs.xz
        pkgs.zip
        pkgs.android-tools
        pkgs.cacert
        pkgs.ungoogled-chromium
        pkgs.jre
      ];
      env = {
        ANDROID_HOME = "$HOME/Android/Sdk";
        ANDROID_SDK_ROOT = "$HOME/Android/Sdk";
        CHROME_EXECUTABLE = "${pkgs.ungoogled-chromium}/bin/chromium";
        PATH = "${pkgs.android-tools}/bin:$HOME/Android/Sdk/cmdline-tools/latest/bin:$PATH";
      };
    };
  };
}