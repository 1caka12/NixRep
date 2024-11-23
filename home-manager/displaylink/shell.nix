{ pkgs ? import <nixpkgs> {} }:

pkgs.buildFHSUserEnv {
  name = "displaylink";
  targetPkgs = pkgs: with pkgs; [
    stdenv
    libdrm
    libusb1
    udev
    glibc
    coreutils
    procps
    bash
    linuxPackages.kernel  # Kernel headers required for compiling
    gcc
  ];
  runScript = "${pkgs.stdenv.shell}";
}
