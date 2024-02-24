{lib, pkgs, ...}:

{
  home.file = {
    nvim = {
      source = dotfiles/nvim/.config/nvim;
      target = ".config/nvim";
      recursive = true;
    };
  };
}


