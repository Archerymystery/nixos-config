{ self, ... }:
{
  flake.nixosModules.security =
    { pkgs, config, ... }:
    {
      services.pcscd.enable = true;

      programs.gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
      };

      environment.systemPackages = with pkgs; [
        wireguard-tools
      ];

    };
}
