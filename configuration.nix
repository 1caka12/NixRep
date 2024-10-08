# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
    imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

    # Use the systemd-boot EFI boot loader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    time.timeZone = "Europe/Amsterdam";  
    users.users.icaka = {
    isNormalUser = true;
    extraGroups = ["wheel" "audio" "bluetooth" "networkmanager"];
    shell = pkgs.fish;
    };
    nix.settings.experimental-features = ["nix-command" "flakes"];

    # Shell stuff
    programs.fish.enable = true;
    # Bluetooth stuff
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;
    services.blueman.enable = true;

    # Audio stuff
    hardware.pulseaudio.enable = true;
    hardware.pulseaudio.support32Bit = true;

    # Network Stuff
    networking.networkmanager.enable = true;
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };
    virtualisation.docker.enable = true;
    # Graphics
    programs.light.enable = true;
    hardware.opengl = {
        enable = true;
    };
    services.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia = { 
        package = config.boot.kernelPackages.nvidiaPackages.stable;
        modesetting.enable = true;
        nvidiaSettings = true;
    };

    # Stuff
    nixpkgs.config.allowUnfree = true;
    programs.steam.enable = true;
    system.stateVersion = "24.05"; # Did you read the comment?
}

