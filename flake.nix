{
  description = "My Fonts";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
      my-fonts = pkgs.callPackage ./default.nix {};
    in {
      packages = {
        inherit my-fonts;
        default = my-fonts;
      };
    })
    // {
      overlays = rec {
        default = my-fonts;
        my-fonts = final: prev: {
          my-fonts = self.packages."${final.system}".my-fonts;
        };
      };
    };
}
