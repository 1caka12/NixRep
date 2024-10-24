{...}:
{
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };
    home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
}
