{ pkgs ? import <nixpkgs> { } }:
with pkgs;
let
  jekyll_env = bundlerEnv rec {
    name = "jekyll_env";
    ruby = ruby_2_7;
    gemfile = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset = ./gemset.nix;
  };
in stdenv.mkDerivation rec {
  name = "jekyll_env";
  buildInputs = [ jekyll_env ruby ];
}
