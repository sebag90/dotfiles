{
  description = "My NixOS Flake";

  inputs = {
    # NixOS official package source, using the nixos-25.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dotfiles.url = "github:sebag90/dotfiles";
    yazi.url = "github:sxyazi/yazi";
  };

   outputs = inputs@{ nixpkgs, nix-darwin, home-manager, ... }: {
    # laptop
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/nixos/configuration.nix
          ./hosts/nixos/hardware-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = false;
            home-manager.useUserPackages = true;
            home-manager.users.seba = import ./hosts/nixos/home.nix;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = {
              dotfiles = inputs.dotfiles;
              hostname = "nixos";
              dotfiles_dir = ".dotfiles";
              yazi = inputs.yazi;
            };
          }
        ];
      };
    };
    # mac
    darwinConfigurations = {
      MB = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./hosts/MB/configuration.nix
          home-manager.darwinModules.home-manager {
            home-manager.useGlobalPkgs = false;
            home-manager.useUserPackages = true;
            home-manager.verbose = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.sebastiano = import ./hosts/MB/home.nix;
            home-manager.extraSpecialArgs = {
              dotfiles = inputs.dotfiles;
              hostname = "MB";
              dotfiles_dir = ".dotfiles";
            };
          }
        ];
      };
    };
  };
}
