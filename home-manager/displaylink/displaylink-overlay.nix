self: super: {
  displaylink = super.callPackage (super.fetchurl {
    url = "https://github.com/NixOS/nixos-hardware/archive/main.tar.gz";
    sha256 = "<hash>";
  }) {};
}

