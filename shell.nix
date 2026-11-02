{ pkgs ? import <nixpkgs> {} }:

let
  # Wrap SBCL with the Quicklisp packages pre-baked from the Nix store
  mySbcl = pkgs.sbcl.withPackages (ps: [
    ps.lquery
    # You can add other Quicklisp packages here, e.g., ps.alexandria
  ]);
in
pkgs.mkShell {
  name = "lisp-lquery-env";

  buildInputs = [
    mySbcl
  ];

  shellHook = ''
    echo "Welcome to your SSG environment!"

  '';
}
