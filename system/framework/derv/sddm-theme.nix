{pkgs}:

let 
	imgLink = "https://www.esa.int/var/esa/storage/images/esa_multimedia/images/2016/08/barents_bloom/16111770-1-eng-GB/Barents_bloom.jpg";

	image = pkgs.fetchurl {
		url = imgLink;
		sha256 = "1cffy8644zxkwk4hpr2blmcfkirrfbzl5igv1prjc6y9a96bwzgk";
	};
in
pkgs.stdenv.mkDerivation {
	name = "sddm-theme";
	src = pkgs.fetchFromGitLab {
		owner = "MarianArlt";
		repo = "sddm-sugar-candy";
		domain = "framagit.org";
		rev = "2b72ef6c6f720fe0ffde5ea5c7c48152e02f6c4f";
		sha256 = "1db4p2d0k5a6avr7dg9h1r7y9mx711ci5dgwmljqjb8pq5b0a22y";
	};

	installPhase = ''
	mkdir -p $out
	cp -R ./* $out/
	cd $out/
	rm ./Backgrounds/Mountain.jpg
	cp -r ${image} $out/Backgrounds/Mountain.jpg
	'';
}
