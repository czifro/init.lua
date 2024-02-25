{
  description = "Will's Neovim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { pkgs, ... } @ inputs: {

    modules = {
      nvim = import ./modules/home-manager;
    };

    packages = [
      pkgs.neovim
    ];

  };
}
