{...} : {
  programs.nixcord = {
    enable = true;
    discord.enable = true;
    vesktop.enable = true;
    config = {
      useQuickCss = true;   # use out quickCSS
      themeLinks = [        # or use an online theme
        "https://raw.githubusercontent.com/link/to/some/theme.css"
      ];
    };
  };
}
