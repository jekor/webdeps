{
  description = "webdeps";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-20.03;
  inputs.flake-utils.url = github:numtide/flake-utils;

  outputs = {self, nixpkgs, flake-utils}:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in {
        defaultPackage = (pkgs.callPackage ./default.nix { }).package;
      }
    );
}
