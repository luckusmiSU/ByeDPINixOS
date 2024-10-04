{
  description = " ";

  inputs = { 
   flake-utils.url = "github:numtide/flake-utils";
   nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  }; 
  outputs = { self, nixpkgs, flake-utils, }:
  flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; }; in
      {
        packages = rec {
          byedpi = (pkgs.callPackage ./packages.nix {});
          default = byedpi;
        };
      }
    ); 
}
