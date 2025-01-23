{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    system-manager = {
      url = "github:numtide/system-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    system-manager,
  }: {
    formatter.aarch64-linux = nixpkgs.legacyPackages.aarch64-linux.nixfmt-rfc-style;

    systemConfigs.default = system-manager.lib.makeSystemConfig {
      modules = [
        ./modules/default.nix
        ./modules/packages-rust.nix
      ];

      config = {
        nixpkgs.hostPlatform = "aarch64-linux";

        system-manager.allowAnyDistro = true;

        environment = {
          etc = {
          };

          systemPackages = with nixpkgs; [
          ];
        };

        systemd.services = {
        };
      };
    };
  };
}
