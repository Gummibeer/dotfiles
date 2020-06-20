DIR="$1"
TARGETDIR="${2:-$HOME/unzip}"
_IFS="$IFS"
IFS=$'\n'
FILES=( $(find "$DIR" -name "*.zip" -type f) )
IFS="$_IFS"

for FILEPATH in "${FILES[@]}"; do
	FILENAME=$(basename -s .zip "$FILEPATH")
	DESTINATIONDIR="$TARGETDIR/$FILENAME"
    [ -d "$DESTINATIONDIR" ] || mkdir -p "$DESTINATIONDIR"
    unzip "$FILEPATH" -d "$DESTINATIONDIR"
    [ -d "$DESTINATIONDIR/__MACOSX" ] && rm -rf "$DESTINATIONDIR/__MACOSX"
done
