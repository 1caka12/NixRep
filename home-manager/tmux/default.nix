{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    plugins = with pkgs; [
      tmuxPlugins.catppuccin
      tmuxPlugins.battery
      tmuxPlugins.better-mouse-mode
    ];
    extraConfig = "
            unbind C-b
            set-option -g prefix C-Space
            bind-key C-Space send-prefix
            set -g status-position top
            set -sg escape-time 0
            set -g base-index 1";
  };
}
