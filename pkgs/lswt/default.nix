{ stdenv
, lib
, fetchFromSourcehut
, wayland
, wayland-protocols
}:

stdenv.mkDerivation rec {
  pname = "lswt";
  version = "1.0.4";

  src = fetchFromSourcehut {
    owner = "~leon_plickat";
    repo = pname;
    rev = "v${version}";
    sha256 = "0kb0167bkmwrz6441arinc00ygmaz5wgsaj7kjrhgs3rqpp1mg1s";
  };

  buildInputs = [ wayland wayland-protocols ];

  installFlags = [ "PREFIX=$(out)" ];

  meta = with lib; {
    description = "lswt, list Wayland toplevels";
    homepage = "https://git.sr.ht/~leon_plickat/lswt";
    changelog = "https://https://git.sr.ht/~leon_plickat/lswt/refs/v${version}";
    license = licenses.gpl3Only;
  };
}
