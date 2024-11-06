{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/refs/tags/24.05.tar.gz") {} }:

pkgs.mkShell {
  packages = [ pkgs.entr pkgs.xml2rfc pkgs.gnumake ];
}
