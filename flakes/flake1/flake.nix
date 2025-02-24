{
  description = "Zsh with Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux"; # Change to "aarch64-linux" for ARM-based systems
      pkgs = import nixpkgs { inherit system; };
      flakeDir = builtins.toPath ./.;
    in {
      homeConfigurations."ampho" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Import the Home Manager configuration
                # modules = [ ${flakeDir}/home.nix ];
        modules = [ ./home.nix ];
      };
    };
}
