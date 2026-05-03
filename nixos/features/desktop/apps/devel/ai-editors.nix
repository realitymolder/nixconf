{self, ...}: {
  flake.nixosModules.ai-editors = {pkgs, ...}: let
    llmPkgs = self.inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system};
  in {
    environment.systemPackages = [
      llmPkgs.opencode
      llmPkgs.pi
      llmPkgs.rtk
    ];

    # What is the diff betweeen ppersistance.data / ppersistance.cache ?
    persistance.cache.directories = [
      ".config/pi"
      ".config/opencode"
    ];
  };
}
