{self, ...}: {
  flake.nixosModules.browsers = {...}: {
 imports = [
   self.nixosModules.firefox
   self.nixosModules.waterfox
self.nixosModules.chromium
 ];
  };
}
