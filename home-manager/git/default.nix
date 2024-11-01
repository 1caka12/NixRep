{...}: {
  programs.git = {
    enable = true;
    userName = "Ivo";
    userEmail = "i.matsaliev@student.vu.nl";
    extraConfig = {
      init = {defaultBranch = "main";};
    };
  };
}
