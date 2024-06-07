{
  lib,
  stdenvNoCC,
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "my-fonts";
  version = "latest";
  src = ./.;
  installPhase = ''
    mkdir -p $out/share/fonts
    install -Dm444 * $out/share/fonts/
  '';
  meta = with lib; {
    description = "Collection of fonts";
    homepage = "http://github.com/71zenith/fonts";
    platforms = platforms.unix;
    maintainers = with maintainers; [zen];
  };
})
