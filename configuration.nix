# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/icaka/.config/nixos";
  };

   # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  time.timeZone = "Europe/Sofia";

  # swap
  swapDevices = [
    {
        device = "/swapfile";
        size = 10 * 1024; #10gib
    }
  ];

  users.users.icaka = {
    isNormalUser = true;
    extraGroups = ["wheel" "audio" "bluetooth" "networkmanager" "video"];
    shell = pkgs.fish;
  };
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Shell stuff
  programs.fish = {
    enable = true;
  };

  environment.shellAliases = {
    wifiscan = "nmcli device wifi list --rescan yes";
  };

  # Bluetooth stuff
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  # Network Stuff
  networking.networkmanager.enable = true;
  
  #hyprland+wayland stuff
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.variables = {
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    NIXOS_OZONE_WL = "1";
  };

  #X stuff
  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
    
    displayManager.sessionCommands = ''
    ${lib.getBin pkgs.xorg.xrandr}/bin/xrandr --setprovideroutputsource 2 0
    '';
  };

  #Greetd
  services.greetd = {
    enable = true;
    vt = 3;
    settings = {
      default_session = {
        user = "icaka";
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland"; # start Hyprland with a TUI login manager
      };
    };
  };
  # VM Stuff
  virtualisation.docker.enable = true;

  # Graphics Stuff
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      vulkan-loader
      vulkan-validation-layers
      vulkan-extension-layer
      vulkan-tools
    ];
  };

  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
    nvidiaSettings = true;
    open = false;
    prime = {
        amdgpuBusId = "PCI:6:0:0";
        nvidiaBusId = "PCI:1:0:0";
        sync.enable = true;
    };
  };

  # Power stuff
  powerManagement.enable = true;
  services.tlp = {
    enable = true;
    settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 20;

       #Optional helps save long term battery health
       START_CHARGE_THRESH_BAT0 = 40; # 40 and bellow it starts to charge
       STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging

      };
  };


  # Screenshare + audioshare + audio
  programs.noisetorch.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    wireplumber.enable = true;
    jack.enable = true;
  };

  # Wayland GUI stuff
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland 
                     pkgs.kdePackages.xdg-desktop-portal-kde];
  };

  # Light stuff
  programs.light.enable = true;

  # Stuff
  nixpkgs.config.allowUnfree = true;
  programs.steam.enable = true;
  system.stateVersion = "24.11"; 

  # Memory Management
  services.earlyoom.enable = true;
  systemd.slices."steam" = {
    sliceConfig = { 
        MemoryMax = "8G";      # Limit to 8GB of RAM
        CPUQuota = "80%";      # Limit CPU usage to 80%
        IOWeight = 200;        # Set I/O priority weight
    };
};

  # unlock GPG keyring on login
  security.pam.services.greetd.enableGnomeKeyring = true;

  # IRC Chats
  services.bitlbee = {
    enable = true;
    plugins = [pkgs.bitlbee-discord];
  };
}
