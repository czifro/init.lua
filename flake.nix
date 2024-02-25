{
  description = "Will's Neovim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { nixpkgs, ... } @ inputs:

  let

  pkgs = import nixpkgs { system = "aarch64-darwin"; };

  in

  {

    modules = {
      nvim = import ./modules/home-manager;
    };

    packages = [
      pkgs.neovim
    ];

  };
}
