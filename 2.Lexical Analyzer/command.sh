flex -o wordcount.c new.l
g++ wordcount.c -lfl -o wordcount.out
./wordcount.out err.txt
