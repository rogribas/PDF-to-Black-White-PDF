#!/bin/bash

input_pdf_name=$1
output_pdf_name=${input_pdf_name::${#input_pdf_name}-4}_bw.pdf
num_pages=$(identify -format "%n\n" $input_pdf_name | head -n1)
echo $num_pages
dpi_res=300
input_pdf_name=$1
echo $input_pdf_name
bw_threshold=$2
#-------------------------------------------------------------------------
gs -sDEVICE=bmpgray -dNOPAUSE -dBATCH -q -r$dpi_res \
   -sOutputFile=./%d.bmp ./$input_pdf_name
#-------------------------------------------------------------------------
for file_num in `seq 1 $num_pages`
do
  convert ./$file_num.bmp -threshold $bw_threshold \
          ./$file_num.tif
done
#-------------------------------------------------------------------------
input_files=""

for file_num in `seq 1 $num_pages`
do
  input_files+="./$file_num.tif "
done

convert "*.tif" -quality 100 $output_pdf_name
#-------------------------------------------------------------------------
# clean up bmp and tif files used in conversion

for file_num in `seq 1 $num_pages`
do
  rm ./$file_num.bmp
  rm ./$file_num.tif
done

