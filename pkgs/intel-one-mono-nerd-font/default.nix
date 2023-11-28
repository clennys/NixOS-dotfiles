{ lib, stdenvNoCC, fetchurl, unzip }:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "intel-one-mono-nerd-font";
  version = "3.1.0";

  srcs = [
    (fetchurl {
      url = "https://github.com/ryanoasis/nerd-fonts/releases/download/v${finalAttrs.version}/IntelOneMono.zip";
      hash = "sha256-NPFnDKlNjzCn0RgaN2GbNdnswZzKE2+zR1OmkCiRGcg=";
    })
  ];

  sourceRoot = ".";

  nativeBuildInputs = [
    unzip
  ];

  installPhase = ''
    runHook preInstall
    install -Dm644 -t $out/share/fonts/truetype/ *.ttf
    runHook postInstall
  '';
})
