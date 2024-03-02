{
  description = "Will's Neovim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... } @ inputs:

  let

  pkgs = import nixpkgs { system = "aarch64-darwin"; };

  in

  {
    modules = {
      home-manager = {
        nvim = import ./modules/home-manager;
      };
    };

    homeConfigurations = {
      czifro = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ modules.home-manager.nvim ];
      };
    };
  };
}
