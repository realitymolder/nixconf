{self, ...}: {
  flake.nixosModules.apps = {...}: {
 imports = [
   self.nixosModules.browsers
   self.nixosModules.communication
 ];
  };
}
