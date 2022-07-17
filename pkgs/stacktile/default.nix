{ stdenv
, lib
, fetchFromSourcehut
, wayland
}:

stdenv.mkDerivation rec {
  pname = "stacktile";
  version = "0.1.1";

  src = fetchFromSourcehut {
    owner = "~leon_plickat";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-1189DlhEf/w7mjg+RAXu6qGM6Xw6/KGS0oNUPnKoD8k=";
  };

  buildInputs = [ wayland ];

  installFlags = [ "PREFIX=$(out)" ];

  meta = with lib; {
    description = "stacktile is a layout generator for the River Wayland compositor.";
    homepage = "https://git.sr.ht/~leon_plickat/stacktile";
    license = licenses.gpl3Only;
  };
}
