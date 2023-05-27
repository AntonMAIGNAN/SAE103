#!/bin/bash

mkdir -p imagemodif
for fichier in $(ls images/*.svg)
do
 
 fichier=${fichier:(-7)}
 nouvfichier=${fichier::3}
 docker container run --rm -ti -v /Docker/"$1"/:/work -w /work sae103-imagick "magick images/$fichier -resize 230x230 -colorspace Gray -shave 15x15 "$nouvfichier".png"

done



# for fichier in $(ls images/*.svg)
# do
 
#  fichier=${fichier:(-7)}
#  nouvfichier=${fichier::3}
#  echo $nouvfichier
#  docker container run --rm -ti -v /Docker/"$1"/images/:/work -w /work sae103-imagick "magick $fichier -resize 230x230 -colorspace Gray -shave 15x15 "$nouvfichier".png"

# done