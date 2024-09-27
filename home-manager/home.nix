{ config, pkgs, ... }:

{
  home.username = "icaka";
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    neofetch
    eza
    zip
    unzip
    glow
    lsof
    htop
    hyprland
    wofi
    vscode
    jetbrains.clion
    kdeconnect
    fish
    ranger
    zoxide
    lazygit
  ];

  programs.git = {
    enable = true;
    userName = "Ivo";
    userEmail = "i.matsaliev@student.vu.nl";
  };

  programs.fish = {
    enable = true;
  };
  programs.firefox.enable = true;
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
        draw_bold_text_with_bright_colors = true;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  programs.home-manager.enable = true;
}