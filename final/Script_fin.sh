mkdir -p fichier_html
chmod +x vendeur_img.sh
./vendeur_img.sh $USER


for fichier in *.txt
do
    docker run --rm -ti -v /Docker/$USER/:/work sae103-php -f extraction.php "$fichier"
    chmod +x qrcode.sh
    ./qrcode.sh $USER

    

    nom=${fichier::-4}

    nom=$(echo $nom | tr ' ' "_")

    docker run --rm -ti -v /Docker/$USER/:/work sae103-php -f region.php > "$nom".html

    chmod +rwx "$nom".html

    chmod +x Script_pdf.sh
    ./Script_pdf.sh $USER "$nom"

    rm "$nom".html
done
tar czf pdf.tar pdf

rm qrcode.png
rm qrcode.dat
rm comm.dat
rm texte.dat
rm tableau.dat
rm -r imagemodif
rm -r pdf
rm *.png

