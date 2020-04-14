{ compiler ? "ghc865" }:

let
sources = import ./nix/sources.nix;
pkgs = (import sources.nixpkgs {}).pkgs;
haskellPackages = pkgs.haskell.packages.${compiler};
drv = haskellPackages.callCabal2nix "dagang" ./. {};
all-hies = import sources.all-hies {};
in {
  dagang = drv;
  dagang-shell = haskellPackages.shellFor {
    packages = p: [drv];
    buildInputs = with pkgs; with haskellPackages;
    [ postgresql
      (all-hies.selection { selector = p: { inherit (p) ghc865; }; })
        hpack cabal-install
    ];
  };
}
