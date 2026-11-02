{ pkgs ? import <nixpkgs> {} }:

let
  myLua = pkgs.lua.withPackages (ps: with ps; [
    # Add any pure-nix lua packages here if needed, e.g., luafilesystem

  ]);
in
pkgs.mkShell {
  buildInputs = [
    myLua
    pkgs.luarocks
  ];

  shellHook = ''
    # Optional: set up a local rocktree in the project directory so htmlparser installs cleanly
    export LUA_PATH="$(luarocks path --lr-path);$LUA_PATH"
    export LUA_CPATH="$(luarocks path --lr-cpath);$LUA_CPATH"
    
    # Check if htmlparser is installed locally, otherwise install it to a local tree
    if ! luarocks list --local | grep -q htmlparser; then
      luarocks install --local htmlparser
    fi
  '' ;
}
