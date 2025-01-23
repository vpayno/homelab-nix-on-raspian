# modules/packages-rust.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  config = {
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
