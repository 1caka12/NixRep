{...} : {
  xdg.desktopEntries = {
    btop = {
      name = "Btop++";
      exec = "kitty -e btop";
      terminal = false;
      type = "Application";
      icon = "btop";
      categories = [ "System" "Monitor" "ConsoleOnly" ];
    };

    yazi = {
      name = "Yazi";
      exec = "kitty -e yazi";
      terminal = false;
      type = "Application";
      icon = "system-file-manager";
      categories = [ "System" "FileManager" "ConsoleOnly" ];
    };
  };
}
