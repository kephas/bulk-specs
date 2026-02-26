{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/refs/tags/24.05.tar.gz") {} }:

pkgs.mkShell {
  packages = with pkgs; [ entr xml2rfc gnumake cbor-diag protobuf ];
}
