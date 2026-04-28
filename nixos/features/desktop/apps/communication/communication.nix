{self, ...}: {
  flake.nixosModules.communication = {...}: {
 imports = [
   self.nixosModules.discord
   self.nixosModules.telegram

 ];
  };
}
