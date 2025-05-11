{...}: {
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
#      cmake.format = "'\\[[$symbol($version)]($style)\\]'";
#      cpp.format = "'\[[$symbol($version(-$name))]($style)\\]'" ;
    };
  };
}
