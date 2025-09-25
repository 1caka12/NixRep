{pkgs,...} : {
  stylix = {
    enable = false;
    autoEnable = false;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";

    targets = {
      kitty.enable = true;
      starship.enable = true;
      bat.enable = true;
    };
  };
}
