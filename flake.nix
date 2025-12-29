{
  description = "Nixos config flake";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #nixvim.url = "";
    nixvim = {
      url = "github:Archerymystery/nixvim-config";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # If you are not running an unstable channel of nixpkgs, select the corresponding branch of Nixvim.
    # url = "github:nix-community/nixvim/nixos-25.11";


    # nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:

    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

    in
    {

      # nixos - system hostname
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs system;
        };
        modules = [
          ./nixos/configuration.nix

        ];
      };

      homeConfigurations.archer = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {
          inherit inputs;
        };
        modules = [ ./home-manager/home.nix ];
      };
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          gcc
          cmake
          pkg-config
          libGL
          libGLU
          glfw
          glew
          freeglut
        ];

        LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath [
          pkgs.libGL
          pkgs.glfw
          pkgs.glew
        ]}";
      };
    };
}

