{ configs, pkgs, ... }:

{
  imports = [
    ./nvim.nix
  ];

  home = {
    packages = [
      pkgs.neovim
    ] ++ configs.home.packages;

    # This is an option, but I prefer splitting it out into neighboring nix files
    # file = {
    #   # tmux
    #   ".local/bin/tmux-sessionizer".source = ../core/tmux/tmux-sessionizer;
    #   ".tmux.conf".source = ../core/tmux/tmux.conf;
    # };

    sessionVariables = {
      EDITOR = "nvim";
    };
  };

}

