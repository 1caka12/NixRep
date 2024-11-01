{pkgs, ...}: {
  home.username = "icaka";
  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    # cli
    eza
    zip
    unzip
    fish
    fzf
    glow
    htop
    lsof
    neofetch
    yazi
    zoxide
    lazygit
    networkmanager
    wl-clipboard

    # apps
    rofi-wayland
    kdeconnect
    eww
    pavucontrol
    hyprshot
    hyprshade
    wireshark
    hyprlock
    obsidian

    # fonts
    nerdfonts

    # development
    man-pages
  ];

  imports = [
    ./nixvim
    ./tmux
    ./git
    ./starship
    ./hyprland
    ./eww
  ];

  programs.ssh.enable = true;
  programs.fish.enable = true;
  programs.firefox.enable = true;
  programs.kitty.enable = true;
}
