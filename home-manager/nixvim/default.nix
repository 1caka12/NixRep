{pkgs, ...}: {
  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin = {
      enable = true;
    };
    opts.clipboard.providers.wl-copy.enable = true;
    globalOpts = {
      number = true;
      relativenumber = true;
      signcolumn = "true";
      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      clipboard = "unnamedplus";
      smarttab = true;
      cursorline = true;
    };
    plugins = {
      web-devicons.enable = true ;
      markdown-preview.enable = true;
      lualine.enable = true;
      treesitter.enable = true;
      lazygit.enable = true;
      luasnip.enable = true;
      gitsigns.enable = true;
      cmp-dap.enable = true;
      #nvim-surround.enable = true;
      noice.enable = true;
      telescope = {
        enable = true;
        keymaps = {
          "<Space>ff" = "find_files";
          "<Space>fg" = "live_grep";
        };
      };
      todo-comments = {
        enable = true;
        settings = {
            colors = {
              error = ["DiagnosticError" "ErrorMsg" "#DC2626"];
              warning = ["DiagnosticWarn" "WarningMsg" "#FBBF24"];
              info = ["DiagnosticInfo" "#2563EB"];
              hint = ["DiagnosticHint" "#10B981"];
              default = ["Identifier" "#7C3AED"];
              test = ["Identifier" "#FF00FF"];
            };
        };
      };
      lsp = {
        enable = true;
        servers = {
          clangd.enable = true;
          #pylsp.enable = true;
          nil_ls.enable = true;
          java_language_server.enable = true;
          cmake.enable = true;
        };
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
            {
              name = "nvim_lsp";
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
#        extraPlugins = [
#          (pkgs.vimUtils.buildVimPlugin {
#            name = "nvim-java";
#            src = pkgs.fetchFromGitHub {
#              owner = "nvim-java";
#              repo = "nvim-java";
#              rev = "905013eb83c58bda992724b3ecbe20f60b58513f";
#              sha256 = "00bj1yq0q7i8p6zn7jqmi3zmkkhqlc62am6srkcf1nydmvmsr1yx";
#            };
#          })
#        ];
  };
}
