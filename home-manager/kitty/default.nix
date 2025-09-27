{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.nerd-fonts.zed-mono;
      name = "Zed Mono";
      #package = pkgs.nerd-fonts.jetbrains-mono;
      #name = "JetBrainsMono Nerd Font";
      size = 13;
    };
    settings = {
      background_opacity = "0.60";
      cursor_shape = "beam";
      cursor_blink_interval = 0;
      enable_audio_bell = "no";
      confirm_os_window_close = 0;
      window_padding_width = "10";
    };
  };
}
