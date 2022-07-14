self: super:

let
  inherit (super) lib;
in
{
  scaleImage = { image, width, height, rounded ? false }:
    super.stdenv.mkDerivation {
      name = "scaled-image.png";
      src = image;
      buildInputs = [ super.imagemagick ];
      phases = [ "buildPhase" "installPhase" ];
      buildPhase = ''
        convert $src -resize ${toString width}x${toString height} \

        ${lib.optionalString rounded ''
          -alpha set \( +clone -distort DePolar 0 \
          -virtual-pixel HorizontalTile -background None -distort Polar 0 \) \
          -compose Dst_In -composite -trim +repage \
        ''}

        image.png
      '';
      installPhase = "install -Dm0644 image.png $out";
    };
}
