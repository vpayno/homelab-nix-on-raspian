{
  config,
  lib,
  pkgs,
  ...
}:

{
  config = {
    nixpkgs.hostPlatform = "aarch64-linux";

    system-manager.allowAnyDistro = true;

    environment = {
      etc = {
        "nix/nix.conf".text = ''
          build-users-group = nixbld
          experimental-features = nix-command flakes ca-derivations cgroups fetch-closure
          trusted-users = root vpayno
          download-buffer-size = 134217728  # 67108864
        '';
      };
      systemPackages = with pkgs; [
        nix-info
      ];
    };

    systemd.services = {
      nix-daemon = {
        enable = true;
      };
    };
  };
}
