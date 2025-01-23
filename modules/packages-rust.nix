# modules/packages-rust.nix
{pkgs, ...}: {
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
