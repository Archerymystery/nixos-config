{ self, ... }:
{
  flake.nixosModules.docker =
    { pkgs, config, ... }:
    {

      virtualisation.docker = {
        enable = true;
        daemon.settings = {
          data-root = "/mnt/tera/docker";
        };
      };

      environment.systemPackages = with pkgs; [
        rustup
        cargo
        rustc
        protobuf
        cmake
        kubectl
        k9s
        helm
        nodejs
        docker-compose
        awscli2
        kubectl

      ];
    };
}
