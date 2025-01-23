{
  config,
  lib,
  pkgs,
  ...
}: {
  config = {
    nixpkgs.hostPlatform = "aarch64-linux";

    system-manager.allowAnyDistro = true;

    imports = [
      ./modules/packages-rust.nix
    ];

    environment = {
      etc = {
        "nix/nix.conf".text = ''
          build-users-group = nixbld
          experimental-features = nix-command flakes ca-derivations cgroups fetch-closure
          trusted-users = root @sudo
          download-buffer-size = 134217728  # 67108864
        '';
      };
      systemPackages = with pkgs; [
        glibcLocales
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
