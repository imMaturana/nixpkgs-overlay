{
  description = "My personal NUR repository";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "i686-linux"
        "x86_64-darwin"
        "aarch64-linux"
        "armv6l-linux"
        "armv7l-linux"
      ];

      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f {
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ self.overlay ];
        };
      });
    in
    {
      overlay = final: prev: import ./default.nix final prev;

      packages = forAllSystems ({ pkgs, ... }: pkgs);
    };
}
