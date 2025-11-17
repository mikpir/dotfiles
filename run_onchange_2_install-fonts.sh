#!/usr/bin/env bash
set -e

FONTSDIR="${XDG_DATA_HOME:-$HOME/.local/share}/fonts"
mkdir -p "$FONTSDIR"

TMPDIR="$(mktemp -d)"
trap 'rm -rf "$TMPDIR"' EXIT

FONTS=(
  CascadiaCode
  JetBrainsMono
  SourceCodePro
  IntelOneMono
  Overpass
  AtkinsonHyperlegibleMono
)

for FONT_NAME in "${FONTS[@]}"; do
  ZIPFILE="$TMPDIR/${FONT_NAME}.zip"
  UNZIPDIR="$TMPDIR/${FONT_NAME}"
  TARGETDIR="$FONTSDIR/${FONT_NAME}"

  mkdir -p "$UNZIPDIR" "$TARGETDIR"

  wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/${FONT_NAME}.zip" \
    -O "$ZIPFILE"

  unzip -o "$ZIPFILE" -d "$UNZIPDIR"

  mv "$UNZIPDIR"/* "$TARGETDIR"/
done

fc-cache -f -v "$FONTSDIR"
