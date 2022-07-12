self: super:

{
  lswt = super.callPackage ./pkgs/lswt { };

  stacktile = super.callPackage ./pkgs/stacktile { };
}
