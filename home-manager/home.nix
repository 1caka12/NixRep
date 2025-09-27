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
    lsof
    neofetch
    yazi
    lazygit
    networkmanager
    wl-clipboard
    alsa-utils
    hyprpaper
    nurl
    ncdu
    fastfetch
    pywal # Color scheme generator under ~/.cache/wal

    # apps
    distrobox
    plasma5Packages.kdeconnect-kde
    rofi-wayland
    kitty
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
    blender
    bitwarden-desktop
    godot
    bluetuith
    atuin # Shell history
    mpv   # Media player
    espanso # Remembers text templates and text variables
    
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
    #./eza
    ./catppuccin
    ./kitty
    ./fastfetch
    ./xdg
    ./rofi
  ];

  services.ssh-agent.enable = true;
  programs.fish = {
    enable = true;
    functions.cd = "z $argv";
    interactiveShellInit = "
      fastfetch
    ";
    functions.fish_greeting = "";
  };
  programs.firefox.enable = true;
  
  programs.btop = {
    enable = true;
    catppuccin.enable = true;
    catppuccin.flavor = "mocha";
  };
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    options = ["--cmd cd"];
  };
  
  home.shellAliases = {
    cat = "bat";
    ls = "eza";
  };

  home.sessionVariables = {
  TERMINAL = "kitty";

  # GTK apps
  GDK_SCALE = "1";
  GDK_DPI_SCALE = "1.5";

  # Qt apps
  QT_SCALE_FACTOR = "1.5";
  QT_AUTO_SCREEN_SCALE_FACTOR = "0";
  QT_FONT_DPI = "144"; # 96 * 1.5

  # XWayland behavior
  XWAYLAND_NO_SCALE = "1";
  EZA_CONFIG_DIR = "$HOME/.config/eza";
};
}
