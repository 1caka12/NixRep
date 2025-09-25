{pkgs, ...}: {
  home.username = "icaka";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    # cli
    bat
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
    nurl

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
    ncdu

    blender
    bitwarden-desktop
    godot
    # fonts
    #nerd-fonts
  ];

  imports = [
    ./nixvim
    ./tmux
    ./git
    ./starship
    ./hyprland
    ./eww
    ./eza
  ];

  services.ssh-agent.enable = true;
  programs.fish.enable = true;
  programs.firefox.enable = true;
  programs.kitty.enable = true;
  
  home.shellAliases = {
    cat = "bat";
    ls = "eza";
  };

  home.sessionVariables = {
  # GTK apps
  GDK_SCALE = "1";
  GDK_DPI_SCALE = "1.5";

  # Qt apps
  QT_SCALE_FACTOR = "1.5";
  QT_AUTO_SCREEN_SCALE_FACTOR = "0";
  QT_FONT_DPI = "144"; # 96 * 1.5

  # XWayland behavior
  XWAYLAND_NO_SCALE = "1";
  EZA_CONFIG_DIR = "$HOME/.config/eza:$PATH";
};
}
