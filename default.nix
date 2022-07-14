self: super:

{
  lib = super.lib // import ./lib.nix self super;

  lswt = super.callPackage ./pkgs/lswt { };

  stacktile = super.callPackage ./pkgs/stacktile { };
}
