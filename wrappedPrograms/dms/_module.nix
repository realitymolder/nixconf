{
  config,
  lib,
  wlib,
  pkgs,
  ...
}: {
  imports = [wlib.modules.default];

  options = {
    settings = lib.mkOption {
      type = wlib.types.structuredValueWith {typeName = "JSON";};
      default = {};
      description = ''
        DankMaterialShell configuration settings as an attribute set,
        to be written to `~/.config/DankMaterialShell/settings.json`.
      '';
    };

    clipboardSettings = lib.mkOption {
      type = wlib.types.structuredValueWith {typeName = "JSON";};
      default = {};
      description = ''
        DankMaterialShell clipboard settings as an attribute set,
        to be written to `~/.config/DankMaterialShell/clsettings.json`.
      '';
    };

    enableSystemMonitoring = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Add needed dependencies to use system monitoring widgets";
    };

    enableVPN = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Add needed dependencies to use the VPN widget";
    };

    enableDynamicTheming = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Add needed dependencies to have dynamic theming support";
    };

    enableAudioWavelength = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Add needed dependencies to have audio wavelength support";
    };

    enableCalendarEvents = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Add calendar events support via khal";
    };

    enableClipboardPaste = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Adds needed dependencies for directly pasting items from the clipboard history.";
    };
  };

  config = {
    package = lib.mkDefault pkgs.dms-shell;

    env = {
      DMS_DISABLE_HOT_RELOAD = "1";
      XDG_CONFIG_HOME = "${placeholder config.outputName}";
    };

    extraPackages =
      [pkgs.quickshell]
      ++ lib.optional config.enableSystemMonitoring pkgs.dgop
      ++ lib.optionals config.enableVPN [
        pkgs.glib
        pkgs.networkmanager
      ]
      ++ lib.optional config.enableDynamicTheming pkgs.matugen
      ++ lib.optional config.enableAudioWavelength pkgs.cava
      ++ lib.optional config.enableCalendarEvents pkgs.khal
      ++ lib.optional config.enableClipboardPaste pkgs.wtype;

    constructFiles.settings = lib.mkIf (config.settings != {}) {
      relPath = "DankMaterialShell/settings.json";
      content = builtins.toJSON config.settings;
    };

    constructFiles.clipboardSettings = lib.mkIf (config.clipboardSettings != {}) {
      relPath = "DankMaterialShell/clsettings.json";
      content = builtins.toJSON config.clipboardSettings;
    };

    meta = {
      maintainers = [];
      platforms = lib.platforms.linux;
      description = "DankMaterialShell (dms) — a Wayland desktop shell built with Quickshell and Go";
    };
  };
}
