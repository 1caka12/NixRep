{ config, pkgs, ... }:
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
    tmux
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
 programs.neovim = {
    enable = true;
    defaultEditor = true;

    # Plugins managed by Home Manager (Nix)
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig          # LSP plugin
      nvim-treesitter          # Treesitter for syntax highlighting
      telescope-nvim           # Telescope for fuzzy finding
    ];

    # Neovim Lua configuration
    extraConfig = ''
      -- Treesitter configuration
      require('nvim-treesitter.configs').setup {
        highlight = {
          enable = true,      -- Enable syntax highlighting
        },
      }

      -- Telescope setup
      require('telescope').setup{}

      -- Keybindings for Telescope
      vim.api.nvim_set_keymap('n', '<leader>ff', [[<cmd>Telescope find_files<CR>]], { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>fg', [[<cmd>Telescope live_grep<CR>]], { noremap = true, silent = true })
    '';
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

  programs.kitty.enable = true;
}
