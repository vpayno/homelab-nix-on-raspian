{
  config,
  lib,
  pkgs,
  ...
}: {
  config = {
    nixpkgs.hostPlatform = "aarch64-linux";

    system-manager.allowAnyDistro = true;

    environment = {
      etc = {
        "profile.d/rust.sh".text = ''
          RUSTC_WRAPPER="sccache"
        '';
      };

      systemPackages = with pkgs; [
        rustc
        cargo
      ];
    };
  };
}
