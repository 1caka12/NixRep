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
        extraGroups = ["wheel" "audio" "bluetooth" "networkmanager" "video"];
        shell = pkgs.fish;
    };

    nix.settings.experimental-features = ["nix-command" "flakes"];
    # Shell stuff
    programs.fish.enable = true;

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

    # VM Stuff
    virtualisation.docker.enable = true;

    # Graphics Stuff
    hardware.opengl = {
        enable = true;
    };

    services.xserver.videoDrivers = ["nvidia"];
    
    hardware.nvidia = { 
        package = config.boot.kernelPackages.nvidiaPackages.stable;
        modesetting.enable = true;
        nvidiaSettings = true;
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
}

