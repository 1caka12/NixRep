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
        ./tmux
        ./git
        ./starship
        ./hyprland
    ];


    programs.ssh.enable = true;
    programs.fish.enable = true;
    programs.firefox.enable = true;
    programs.kitty.enable = true;
}
