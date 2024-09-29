{ config, pkgs, nixvim,... }:
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
    tmux
    pavucontrol
  ];

  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
  };
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
  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin = {
        enable = true;
    };
    globalOpts = {
        number = true;
        relativenumber = true;
        signcolumn = "true";
        tabstop = 4;
        shiftwidth = 4;
        expandtab = true;
        smarttab = true;
        clipboard = "unnamedplus";
        cursorline = true;
    };
     plugins = {
        lualine.enable = true;
        treesitter.enable = true;
        lazygit.enable = true;
        luasnip.enable = true;
        gitsigns.enable = true;
        telescope.enable = true;
        todo-comments = {
            enable = true;
            colors = {
                error = ["DiagnosticError" "ErrorMsg" "#DC2626"];
                warning = ["DiagnosticWarn" "WarningMsg" "#FBBF24"];
                info = ["DiagnosticInfo" "#2563EB"];
                hint = ["DiagnosticHint" "#10B981"];
                default = ["Identifier" "#7C3AED"];
                test = ["Identifier" "#FF00FF"];
            };
       };
       lsp = {
	   servers.clangd.enable = true;
       };     
    };
};
  programs.kitty.enable = true;
}
