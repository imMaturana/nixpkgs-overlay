{ pkgs ? import <nixpkgs> { } }:

{
  lswt = pkgs.callPackage ./pkgs/lswt { };

  stacktile = pkgs.callPackage ./pkgs/stacktile { };
}
