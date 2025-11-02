{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    catppuccin.url = "github:catppuccin/nix/release-25.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixcord.url = "github:kaylorben/nixcord";
};
  outputs = inputs @ {
    nixpkgs,
    home-manager,
    nixvim,
    catppuccin,
    nixcord,
    nixos-hardware,
    ...
  }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
#          nixos-hardware.nixosModules.lenovo-ideapad-15ach6
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.icaka.imports = [
                ./home-manager/home.nix
                nixvim.homeModules.nixvim
                catppuccin.homeModules.catppuccin
                nixcord.homeModules.nixcord
              ];
          }
        ];
      };
    };
  };
}
