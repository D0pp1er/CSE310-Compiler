#!/bin/bash

yacc -d -y 1905028.y
echo 'Generated the parser C file as well the header file'
g++ -ggdb3 -w -c -o y.o y.tab.c
echo 'Generated the parser object file'
flex 1905028.l
echo 'Generated the scanner C file'
g++ -ggdb3 -w -c -o l.o lex.yy.c
# if the above command doesn't work try g++ -fpermissive -w -c -o l.o lex.yy.c
echo 'Generated the scanner object file'
g++ -ggdb3 y.o l.o -ll -o a
echo 'All ready, running'
valgrind valgrind --leak-check=full \
         --show-leak-kinds=all \
         --track-origins=yes \
         --log-file=valgrind-out.txt ./a sserror.c