{...} : {
  programs.fastfetch = {
    enable = true;
  };
  home.file.".config/fastfetch/tau.txt".text = ''
             =*=:.    .:=*+             
         #*-::=+**####**+=::-+#         
      =+::+##@@#=:    :=#@@##+-:++      
    ==.+%*-.#@=          =@%.-*%+.=+    
   +.=%+.  =@#            #@=  .+%+.+.  
 .-.##.    -@#            #@=    .##.-: 
 -.%*       #@*.         +@#       *%.- 
- ##         =%%+-:..:-+%%+         ## =
::@-           -+#%@@%#+-           -@-:
 =@.               @@.               @+ 
 =@.               @@.               @+ 
.:@-               @@.              -@-.
  ##               @@.              ##  
 ..%*              @@.             *%.. 
   .##.            @@.           .##.   
    .=%+.          @@.         .+%=.    
      .=%*-.       @@.      .-*%+.      
         :+##+=:...@@...:-+##+:         
             .=+**####**+=.
  '';
  home.file.".config/fastfetch/config.jsonc".text = ''
  {
    "logo": {
      "type": "file",
      "source": "/home/icaka/.config/fastfetch/tau.txt"
    },
    "modules": [
      "os",
      "kernel",
      "uptime",
      "packages",
      "shell",
      "wm",
      "cpu",
      "gpu",
      "memory"
    ]
  }
  '';
}
