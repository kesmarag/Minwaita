#! /bin/bash
cd Compiled
for variant in "" '-OSX' '-Vanilla'; do
  cd Minwaita${variant^}
  tar -czf Minwaita${variant^}.tar.gz Minwaita${variant^} Minwaita${variant^}-Dark Minwaita-Light-Shell
  mv Minwaita${variant^}.tar.gz ../..
  cd ..
done
