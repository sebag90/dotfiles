{
  description = "My NixOS Flake";

  inputs = {
    # NixOS official package source, using the nixos-25.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dotfiles.url = "github:sebag90/dotfiles";
  };

   outputs = inputs@{ nixpkgs, home-manager, dotfiles, ... }: {
    nixosConfigurations = {
      # linux laptop
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
            home-manager.extraSpecialArgs = {
              dotfiles = dotfiles;
              hostname = "nixos";
            };
          }
        ];
      };
    };
  };
}
