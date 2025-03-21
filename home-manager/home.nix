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
    btop
    lsof
    neofetch
    yazi
    zoxide
    lazygit
    networkmanager
    wl-clipboard
    alsa-utils
    hyprpaper

    # apps
    rofi-wayland
    #kdeconnect
    eww
    pavucontrol
    hyprshot
    hyprshade
    wireshark
    hyprlock
    obsidian
    librewolf
    guitarix
    discord
    thunderbird
    kando
    dust

    #wallpaper engine
    swww
    waypaper

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
