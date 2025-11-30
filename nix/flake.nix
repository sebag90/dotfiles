{
  description = "My NixOS Flake";

  inputs = {
    # NixOS official package source, using the nixos-25.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dotfiles.url = "github:sebag90/dotfiles";
    ghostty.url = "github:ghostty-org/ghostty";
    helix.url = "github:helix-editor/helix";
    goosebutils.url = "github:sebag90/goosebutils";
  };

   outputs = inputs@{ nixpkgs, nix-darwin, home-manager, ... }: {
    # laptop
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/nixos/configuration.nix
          ./hosts/nixos/hardware-configuration.nix
          ./hosts/common/allowunfree.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.seba = import ./hosts/nixos/home.nix;
            home-manager.extraSpecialArgs = {
              dotfiles = inputs.dotfiles;
              ghostty = inputs.ghostty;
              helix = inputs.helix;
              goosebutils = inputs.goosebutils;
              hostname = "nixos";
              dotfiles_dir = ".dotfiles";
            };
          }
        ];
      };
    };
    # mac
    darwinConfigurations = {
      mac = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./hosts/mac/configuration.nix
          ./hosts/common/allowunfree.nix
          home-manager.darwinModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.verbose = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.sebastiano = import ./hosts/mac/home.nix;
            home-manager.extraSpecialArgs = {
              dotfiles = inputs.dotfiles;
              hostname = "mac";
              helix = inputs.helix;
              goosebutils = inputs.goosebutils;
              dotfiles_dir = ".dotfiles";
            };
          }
        ];
      };
    };

    # generic
    homeConfigurations = {
      generic = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux"; # Change to aarch64-linux if needed
        };

        extraSpecialArgs = {
          dotfiles = inputs.dotfiles;
          hostname = "generic";
          helix = inputs.helix;
          goosebutils = inputs.goosebutils;
          dotfiles_dir = ".dotfiles";
        };

        modules = [
          ./hosts/common/allowunfree.nix
          ./hosts/generic/home.nix
        ];
      };
    };
  };
}
