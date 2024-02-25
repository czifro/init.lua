{ configs, pkgs, ... }:

{
  imports = [
    ./nvim.nix
  ];

  home = {
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

