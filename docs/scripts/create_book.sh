#!/bin/bash
# Create the PDFs
#
# Usage:
#
# ./create_book_1.sh
#

build_folder=build

rm -rf build
mkdir build

if [ ! -d $build_folder ]; then 
  echo "Error: failed to create build folder"
  exit 1
fi

# Concatenate all markdown files, convert those to one PDF
#
# We are in the 'scripts' folder
#cp ../lessons/*.* $build_folder
cp ../misc/foreword/*.* $build_folder

cat ../misc/foreword/README.md > $build_folder/README.md

echo " " >> $build_folder/README.md
echo "\pagebreak" >> $build_folder/README.md
echo " " >> $build_folder/README.md

cat ../lessons/1_turn_everything_on_and_off.md >> $build_folder/README.md

echo " " >> $build_folder/README.md
echo "\pagebreak" >> $build_folder/README.md
echo " " >> $build_folder/README.md

cat ../lessons/2_be_a_good_controller.md >> $build_folder/README.md

echo " " >> $build_folder/README.md
echo "\pagebreak" >> $build_folder/README.md
echo " " >> $build_folder/README.md

cat ../lessons/3_prepare_cutting.md >> $build_folder/README.md

echo " " >> $build_folder/README.md
echo "\pagebreak" >> $build_folder/README.md
echo " " >> $build_folder/README.md

cat ../lessons/4_extinguish_fire_as_controller.md >> $build_folder/README.md

echo " " >> $build_folder/README.md
echo "\pagebreak" >> $build_folder/README.md
echo " " >> $build_folder/README.md

cat ../lessons/5_your_first_cut_as_controller.md >> $build_folder/README.md

echo " " >> $build_folder/README.md
echo "\pagebreak" >> $build_folder/README.md
echo " " >> $build_folder/README.md

cat ../lessons/6_be_a_good_operator.md >> $build_folder/README.md

echo " " >> $build_folder/README.md
echo "\pagebreak" >> $build_folder/README.md
echo " " >> $build_folder/README.md

cat ../lessons/7_extinguish_fire_as_operator.md >> $build_folder/README.md

echo " " >> $build_folder/README.md
echo "\pagebreak" >> $build_folder/README.md
echo " " >> $build_folder/README.md

cat ../lessons/8_your_first_cut_as_operator.md >> $build_folder/README.md

echo " " >> $build_folder/README.md
echo "\pagebreak" >> $build_folder/README.md
echo " " >> $build_folder/README.md

cat ../lessons/9_certification.md >> $build_folder/README.md

cp guide_style.theme $build_folder

cd "${build_folder}" || exit 41

#
# We are in the 'scripts/build' folder
#

# Table of Content
# Code has highlights following the tango color scheme
# Thinner margin of 0.5 inch
# Do not cut code blocks


pandoc README.md -o book_without_cover.pdf --toc --toc-depth=1 --highlight-style=guide_style.theme -V geometry:margin=0.5in

cp book_without_cover.pdf ../../pdfs/book_without_cover.pdf

cd ../../pdfs || exit 42
#
# We are in the 'pdfs' folder
#
pdfunite cover.pdf book_without_cover.pdf book.pdf

# Make booklet
bookletimposer -a book.pdf -o booklet.pdf

# Cleanup
rm book_without_cover.pdf
