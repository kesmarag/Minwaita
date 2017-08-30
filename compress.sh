#! /bin/bash
THEME="Minwaita"
cd Compiled

for buttons in '' '-OSX' '-Vanilla'; do
  cd $THEME${buttons}${variant}
  tar -czf $THEME${buttons}.tar.gz *
  mv $THEME${buttons}.tar.gz ../..
  cd ..
done
