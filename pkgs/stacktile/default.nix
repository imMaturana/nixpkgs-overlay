{ stdenv
, lib
, fetchFromSourcehut
, wayland
, wayland-protocols
}:

stdenv.mkDerivation rec {
  pname = "stacktile";
  version = "2022-02-08";

  src = fetchFromSourcehut {
    owner = "~leon_plickat";
    repo = pname;
    rev = "10c25adfaec995967088f78ed9ddc0203022bbef";
    sha256 = "05xszs8naxqrn7dp9m3232j6lr8flppq4fywqhfcr4w3qzihp37s";
  };

  buildInputs = [ wayland wayland-protocols ];

  installFlags = [ "PREFIX=$(out)" ];

  meta = with lib; {
    description = "stacktile is a layout generator for the River Wayland compositor.";
    homepage = "https://git.sr.ht/~leon_plickat/stacktile";
    license = licenses.gpl3Only;
  };
}
