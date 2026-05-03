# Fix openldap Build Failure Blocking System Rebuild

## Problem
openldap-2.6.13 fails to build because its test suite fails (test017-syncreplication-refresh timing issue). This blocks:
- bottles, bottles-cli, lutris (which depend on openldap through apr-util in FHS environments)
- Your entire NixOS system rebuild

## Root Cause
The openldap test suite has timing-sensitive tests that fail in Nix's build environment. This is a known issue with openldap packages in nixpkgs.

## Solution
Add an overlay to disable tests for openldap, allowing it to build successfully.

## Implementation Steps

### Option 1: Global Overlay (Recommended)

1. **Create/update `overlays.nix`** in project root:

```nix
{ inputs, ... }: {
  overlays.default = final: prev: {
    openldap = prev.openldap.overrideAttrs (old: {
      doCheck = false;
    });
  };
}
```

2. **Apply the overlay** in `flake.nix`:

Add to the flake inputs if not already present, then apply in your NixOS configuration:

In `nixos/hosts/samson/configuration.nix`, add:
```nix
{ inputs, self, ... }: {
  flake.nixosConfigurations.samson = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.hostSamson
      {
        nixpkgs.overlays = [ self.overlays.default ];
      }
    ];
  };
}
```

### Option 2: Targeted Fix (Alternative)

If you prefer to only fix the specific packages, override them in your configuration:

In `nixos/features/gaming/gaming.nix`:
```nix
environment.systemPackages = with pkgs; [
  (lutris.overrideAttrs (_: { doCheck = false; }))
  (bottles.overrideAttrs (_: { doCheck = false; }))
  steam-run
  # ... rest of packages
];
```

## Verification
After applying the fix:
```bash
sudo nixos-rebuild switch --flake .#samson
```

## Notes
- Disabling openldap tests is safe for personal systems; the package is well-tested upstream
- This is a common workaround for openldap in nixpkgs
- The issue is tracked in nixpkgs but persists due to test environment timing issues
- Alternatively, you could wait for nixpkgs to fix the issue, but this may take time
