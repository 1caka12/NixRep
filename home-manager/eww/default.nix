{...}: {
  home.file.".config/eww/eww.yuck".source = ./eww.yuck;
  home.file.".config/eww/eww.scss".source = ./eww.scss;
  home.file.".config/eww/audio.sh" = {
    source = ./audio.sh;
    executable = true;
  };
  home.file.".config/eww/bat.sh" = {
    source = ./bat.sh;
    executable = true;
  };
}
