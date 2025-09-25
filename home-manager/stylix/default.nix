{pkgs,...} : {
  programs.stylix = {
    enable = true;
    autoEnable = false;  # stop auto loading all possible targets
    targets.anki.enable = false;
    targets.kitty.enable = true;
    targets.starship.enable = true;
    targets.bat.enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
  };
}
