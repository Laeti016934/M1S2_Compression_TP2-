if [ -d "out/$1" ]; then rm -Rf out/$1; fi
mkdir out/$1;
mkdir out/$1/RGB;
g++ src/PSNR.cpp -o PSNR -Wall;
g++ src/compression.cpp -o compression -Wall;
g++ src/decompression.cpp -o decompression -Wall;
./compression img/${1}.ppm out/$1/RGB/${1}R.pgm out/$1/RGB/${1}G.pgm out/$1/RGB/${1}B.pgm;
./decompression out/$1/RGB/${1}R.pgm out/$1/RGB/${1}G.pgm out/$1/RGB/${1}B.pgm out/$1/RGB/${1}final.ppm;
./PSNR img/${1}.ppm out/$1/RGB/${1}final.ppm;
exit 0;