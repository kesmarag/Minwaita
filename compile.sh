#! /bin/bash
THEME="Minwaita"
for buttons in "" "-OSX" "-Vanilla"; do
  for variant in "","", "-Light","-light"; do IFS=","; set -- $variant;

    INPUT=src/gnome-shell

    if [[ "$1" == "-Light" ]]; then
      OUTPUT=Compiled/${THEME}${buttons}/${THEME}-Light-Shell/gnome-shell
      sassc -t expanded $INPUT/gnome-shell$2.scss $OUTPUT/gnome-shell.css

    else
      OUTPUT=Compiled/${THEME}${buttons}/${THEME}${buttons}/gnome-shell
      sassc -t expanded $INPUT/gnome-shell$2.scss $OUTPUT/gnome-shell.css
    fi

    cp $INPUT/assets${2}/* $OUTPUT/assets/ -R
  done

  for variant in "","" "-dark","-Dark" "-darker","-Darker"; do IFS=","; set -- $variant;
    INPUT=src/gtk-3.0
    OUTPUT=Compiled/$THEME${buttons}/$THEME${buttons}$2/gtk-3.0
    cp $INPUT/common-assets/* $OUTPUT/assets/

    if [[ "$2" != "-Dark" ]]; then
      sassc -t expanded $INPUT/gtk${buttons,,}$1.scss $OUTPUT/gtk.css
      sassc -t expanded $INPUT/gtk${buttons,,}-dark.scss $OUTPUT/gtk-dark.css
      cp $INPUT/assets/* $OUTPUT/assets/
      cp $INPUT/assets-dark/* $OUTPUT/assets
    else
      sassc -t expanded $INPUT/gtk${buttons,,}-dark.scss $OUTPUT/gtk.css
      cp $INPUT/assets-dark/* $OUTPUT/assets
    fi

    if [[ "$buttons" = "-OSX" ]]; then
      cp $INPUT/window-buttons/osx/common/* $OUTPUT/assets/window-buttons

      if [[ "$2" = "-Dark" ]] || [[ "$2" = "-Darker" ]]; then
        cp $INPUT/window-buttons/osx/dark/* $OUTPUT/assets/window-buttons
      else
        cp $INPUT/window-buttons/osx/light/* $OUTPUT/assets/window-buttons
        cp $INPUT/window-buttons/osx/dark/* $OUTPUT/assets/window-buttons
      fi
    fi

    if [[ "$buttons" = "" ]]; then
      if [[ "$2" = "-Dark" ]] || [[ "$2" = "-Darker" ]]; then
        cp $INPUT/window-buttons/vertex/dark/* $OUTPUT/assets/window-buttons
      else
        cp $INPUT/window-buttons/vertex/light/* $OUTPUT/assets/window-buttons
        cp $INPUT/window-buttons/vertex/dark/* $OUTPUT/assets/window-buttons
      fi
    fi

    ######

    INPUT=src/gtk-2.0
    OUTPUT=Compiled/$THEME${buttons}/$THEME${buttons}$2/gtk-2.0
    cp $INPUT/gtkrc$1 $OUTPUT/gtkrc
    cp $INPUT/common-files/* $OUTPUT/
    if [[ "$2" != "-Dark" ]]; then
      cp $INPUT/assets/* $OUTPUT/assets
      cp $INPUT/dark-variant-files/* $OUTPUT
    else
      cp $INPUT/assets-dark/* $OUTPUT/assets
    fi
  done
done
