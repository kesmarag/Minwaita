#! /bin/bash
THEME="Minwaita"
cd Compiled

for buttons in '' '-OSX' '-Vanilla'; do
for variant in '' '-Dark' '-Darker'; do
  cd $THEME${buttons}${variant}
  tar -czf $THEME${buttons}${variant}.tar.gz *
  mv $THEME${buttons}${variant}.tar.gz ../..
  cd ..
done
done
done
