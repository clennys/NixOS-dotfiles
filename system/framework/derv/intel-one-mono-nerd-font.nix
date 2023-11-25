{ lib, stdenvNoCC, fetchurl, unzip }:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "intel-one-mono-nerd-font";
  version = "3.1.0";

  srcs = [
    (fetchurl {
      url = "https://github.com/ryanoasis/nerd-fonts/releases/download/v${finalAttrs.version}/IntelOneMono.zip";
      hash = "sha256-1j0rj4l919jk8yrny4yakk0yrn9mkdhkf6hqs6kk13sdm466gw9l";
    })
  ];

  sourceRoot = ".";

  nativeBuildInputs = [
    unzip
  ];

  installPhase = ''
    runHook preInstall
    install -Dm644 -t $out/share/fonts/truetype/ ttf/*.ttf
    runHook postInstall
  '';
})
