{inputs, ...}: {
  perSystem = {pkgs, ...}: {
    packages.dms = (inputs.wrapper-modules.lib.wrapModule ./_module.nix).wrap {
      inherit pkgs;
      settings = {};
      clipboardSettings = {};
      enableDynamicTheming = true;
      enableSystemMonitoring = true;
      enableAudioWavelength = true;
      enableCalendarEvents = true;
      enableClipboardPaste = true;
      enableVPN = true;
    };
  };
}
