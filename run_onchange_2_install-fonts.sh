#!/usr/bin/env bash

TMPDIR=/tmp/fonts
mkdir -p $TMPDIR
for FONT_NAME in CascadiaCode JetBrainsMono SourceCodePro IntelOneMono Overpass; do
  ZIPFILE="$TMPDIR/fonts.zip"

  INSTDIR="$TMPDIR/$FONT_NAME"
  SYSDIR=/usr/local/share/fonts/$FONT_NAME

  sudo mkdir -p $SYSDIR
  sudo mkdir -p $INSTDIR

  wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/$FONT_NAME.zip" -O "$ZIPFILE"
  sudo unzip "$ZIPFILE" -d "$INSTDIR"
  rm "$ZIPFILE"
  sudo mv $INSTDIR/* $SYSDIR

  sudo chown -R root: $SYSDIR
  sudo chmod 644 $SYSDIR/*
  sudo restorecon -RF $SYSDIR
done

sudo rm -rf $TMPDIR

sudo fc-cache -v
