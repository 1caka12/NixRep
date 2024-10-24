{ pkgs,... }:
{
  home.username = "icaka";
  home.stateVersion = "24.05";
  
  home.packages = with pkgs; [
    neofetch
    eza
    zip
    unzip
    glow
    lsof
    htop
    rofi-wayland
    vscode
    jetbrains.clion
    kdeconnect
    fish
    yazi
    zoxide
    lazygit
    networkmanager
    nerdfonts
    fzf
    pavucontrol
    man-pages
    discord
    wl-clipboard
    hyprshot
    wireshark
    eww
    hyprshade
  ];
    imports = [
        ./nixvim
    ];
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
  };

  programs.ssh = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = "Ivo";
    userEmail = "i.matsaliev@student.vu.nl";
  };
  programs.fish = {
    enable = true;
  };
  programs.tmux = {
    enable = true;
    plugins = with pkgs;[
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
        set -g base-index 1
    ";
  };
  programs.firefox.enable = true;
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };
  programs.kitty.enable = true;
}
