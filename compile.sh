#! /bin/bash
COMPILED_FOLDER="Releases"

echo "Copy Light Shell variant."
sassc -t expanded gnome-shell/gnome-shell-light.scss $COMPILED_FOLDER/Minwaita-Light-Shell/gnome-shell/gnome-shell.css
for variant in '' '-Vanilla' '-OSX'; do
  echo "Copy Shell for each variant. (Minwaita${variant})"
  sassc -t expanded gnome-shell/gnome-shell.scss $COMPILED_FOLDER/Minwaita${variant}/Minwaita${variant}/gnome-shell/gnome-shell.css
done
for variant in '' '-Vanilla' '-OSX'; do
  sassc -t expanded gtk-3.0/gtk${button,,}.scss $COMPILED_FOLDER/Minwaita${variant}/Minwaita${variant}/gtk-3.0/gtk.css
  sassc -t expanded gtk-3.0/gtk${button,,}-dark.scss $COMPILED_FOLDER/Minwaita${variant}/Minwaita${variant}/gtk-3.0/gtk-dark.css
  for color in '-Dark'; do
    sassc -t expanded gtk-3.0/gtk${button,,}-dark.scss $COMPILED_FOLDER/Minwaita${variant}/Minwaita${variant}${color,}/gtk-3.0/gtk.css
  done
done
