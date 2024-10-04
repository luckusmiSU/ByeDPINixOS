{ stdenv, pkgs, libX11, pkg-config, inotify-tools, fetchFromGitHub }:
with pkgs.lib;

stdenv.mkDerivation rec {
  pname = "byedpi";
  version = "1.0";

  src = fetchFromGitHub {
   owner = "hufrea";
   repo = "byedpi";
   rev = "322f9261cc58caf97a06c715e5580874ab93ada5";
   sha256 = "sha256-6MpcUtK7l213UE/b1xYtX0SnMdsOoHCKyLhn3Pq3WM8=";
  };

  nativeBuildInputs = [ pkg-config inotify-tools];
  buildInputs = [ libX11 inotify-tools ];


  unpackPhase = ''
   cp -r $src/* .
   ls -l -a 
   ls -l -a
  '';

  installPhase = ''
   mkdir -p $out/bin
   mv ciadpi $out/bin/ciadpi
   chmod 555 $out/bin/ciadpi 
  '';
}
