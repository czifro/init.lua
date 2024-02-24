{
  description = "Will's Neovim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { ... } @ inputs: {

    modules = {
      nvim = import ./modules/home-manager;
    };

  };
}
