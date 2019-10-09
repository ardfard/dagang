let
  config = {
    packageOverrides = pkgs: rec {
      haskellPackages = pkgs.haskellPackages.override {
        overrides = new: old:  rec {
          dagang = 
            new.callCabal2nix "dagang" ./. {
            };
        };
      };
    };
  };
  pkgs = import <nixpkgs> { inherit config; };
in 
  pkgs.haskellPackages.dagang
