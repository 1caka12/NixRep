{pkgs, ...}: {
  home.username = "icaka";
  home.stateVersion = "24.11";

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

    #kdeconnect
    
    # apps
    rofi-wayland
    slack
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
    zathura
    zoom-us

    # fonts
    nerdfonts
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
