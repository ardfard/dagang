{ compiler ? "ghc865" }:

let
sources = import ./nix/sources.nix;
pkgs = (import sources.nixpkgs {}).pkgs;
haskellPackages = pkgs.haskell.packages.${compiler};
drv = haskellPackages.callCabal2nix "dagang" ./. {};
ghcide = import sources.ghcide-nix {};
in {
  dagang = drv;
  dagang-shell = haskellPackages.shellFor {
    packages = p: [drv];
    buildInputs = with pkgs; with haskellPackages;
    [ postgresql
      hpack 
      cabal-install
      ghcide.ghcide-ghc865
    ];
  };
}
