{pkgs, ...} :

{
  packages = with pkgs;[
    hyprland
    alacritty
    firefox
    wofi
    vscode
    jetbrains.clion
    kdeconnect
    fish
    ranger
    zoxide
  ]

  networking.firewall = rec {
	allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
  	allowedUDPPortRanges = allowedTCPPortRanges;
  };

  nixpkgs.config.allowUnfree = true;
}
