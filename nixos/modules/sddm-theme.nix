{ pkgs }:
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "Zhaith-Izaliel";
    repo = "sddm-sugar-candy-nix";
    rev = "00e0aff3ebf64cebfc16bb6df7e69d8923bbd4ef";
    sha256 = "0i63p07xsazwcdscl2r8y1sdglfzq64qrcgncv5sv1hq7mi177qs";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    cd $out/
    cp -r ${../../media/wallpaper.png} $out/Backgrounds/wallpaper.png
    sed -i 's|Background=.*|Background="Backgrounds/wallpaper.png"|' theme.conf
    sed -i "s/ScreenWidth.*/ScreenWidth="1920"/" theme.conf
    sed -i "s/ScreenHeight.*/ScreenHeight="1080"/" theme.conf 
  '';
}
