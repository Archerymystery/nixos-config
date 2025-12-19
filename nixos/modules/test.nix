{ stdenv, fetchFromGitHub }:
{
  sddm-astronaut = stdenv.mkDerivation rec {
    pname = "sddm-astronaut";
    version = "1.0-unstable-2025-01-05";
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -aR $src $out/share/sddm/themes/sddm-astronaut
    '';
    src = fetchFromGitHub {
      owner = "Keyitdev";
      repo = "sddm-astronaut-theme";
      rev = "11c0bf6147bbea466ce2e2b0559e9a9abdbcc7c3";
      sha256 = "sha256-gBSz+k/qgEaIWh1Txdgwlou/Lfrfv3ABzyxYwlrLjDk=";
    };
  };
}
