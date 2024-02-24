{
  description = "Will's Neovim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs } @ inputs: {

    modules = {
      nvim = import ./modules/home-manager.nix;
    };

  };
}
