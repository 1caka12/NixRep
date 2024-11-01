{
  self,
  pkgs,
  ...
}: {
  options = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "nvim-java";
        src = pkgs.fetchFromGitHub {
          owner = "nvim-java";
          repo = "nvim-java";
          rev = "905013e";
        };
      })
    ];
  };
}
