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
    ";
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
           enable = true;
           servers.clangd.enable = true;
       };     
        cmp = {
          enable = true;
          settings = {
            autoEnableSources = true;
            experimental = {ghost_text = false;};
            performance = {
              debounce = 60;
              fetchingTimeout = 200;
              maxViewEntries = 30;
            };
            snippet = {expand = "luasnip";};
            formatting = {fields = ["kind" "abbr" "menu"];};
            sources = [
              {name = "git";}
              {name = "nvim_lsp";
               keywordLength = 3;
              }
              {name = "emoji";}
              {
                name = "buffer"; # text within current buffer
                option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
                keywordLength = 3;
              }
              {
                name = "path"; # file system paths
                keywordLength = 3;
              }
              {
                name = "luasnip"; # snippets
                keywordLength = 3;
              }
            ];

            window = {
              completion = {border = "shadow";};
              documentation = {border = "rounded";};
            };

            mapping = {
              "<Down>" = "cmp.mapping.select_next_item()";
              "<Tab>" = "cmp.mapping.select_next_item()";
              "<Up>" = "cmp.mapping.select_prev_item()";
              "<C-e>" = "cmp.mapping.abort()";
              "<C-Up>" = "cmp.mapping.scroll_docs(-4)";
              "<C-Down>" = "cmp.mapping.scroll_docs(4)";
              "<CR>" = "cmp.mapping.confirm({select=false})";
              "<C-y>" = "cmp.mapping.confirm({select=true})";
            };
          };
        };
    cmp-nvim-lsp = {enable = true;}; # lsp
    cmp-buffer = {enable = true;};
    cmp-path = {enable = true;}; # file system paths
    cmp_luasnip = {enable = true;}; # snippets
    cmp-cmdline = {enable = false;}; # autocomplete for cmdline      
    };
};
  programs.kitty.enable = true;
}
