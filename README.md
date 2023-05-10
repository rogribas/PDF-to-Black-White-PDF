# PDF-to-Black-White-PDF
Bash script to convert any PDF to a Black &amp; White PDF (not grayscale) using a certain treshold

Dependencies: imagick

```
chmod 777 .pdf2bw.sh # one time
./pdf2bw.sh <PATH_OF_INPUT_PDF> <THRESHOLD>
```
Treshold shoud be a percentage, eg. "40%", "75%", etc. Bigger percentage -> darker output image (more black)

Credits: adaptation of the code response from OccamsRazor
https://unix.stackexchange.com/questions/84709/how-can-i-convert-a-pdf-file-from-gray-scale-to-black-white
