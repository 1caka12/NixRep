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
  time.timeZone = "Europe/Amsterdam";

  users.users.icaka = {
    isNormalUser = true;
    extraGroups = ["wheel" "audio" "bluetooth" "networkmanager" "video"];
    shell = pkgs.fish;
  };
  nix.settings.experimental-features = ["nix-command" "flakes"];
  # Shell stuff
  programs.fish = {
    enable = true;
    shellInit= ''
      function untarinto
        set folder_name (string replace ".tar" "" $argv[1])
        mkdir -p $folder_name
        tar -xvf $argv[1] -C $folder_name
      end
    '';  };
  # Bluetooth stuff
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  # Network Stuff
  networking.networkmanager.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  environment.variables = {
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  };
  services.xserver.windowManager.awesome.enable = true;

  # VM Stuff
  virtualisation.docker.enable = true;

  # Graphics Stuff
  hardware.opengl = {
    enable = true;
  };
services.xserver.displayManager.sessionCommands = ''
    ${lib.getBin pkgs.xorg.xrandr}/bin/xrandr --setprovideroutputsource 2 0
'';

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
    nvidiaSettings = true;
    open = false;
  };

  # Screenshare + audioshare
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Light stuff
  programs.light.enable = true;

  # Stuff
  nixpkgs.config.allowUnfree = true;
  programs.steam.enable = true;
  system.stateVersion = "24.05"; # Did you read the comment?
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
  # unlock GPG keyring on login
  security.pam.services.greetd.enableGnomeKeyring = true;
}
