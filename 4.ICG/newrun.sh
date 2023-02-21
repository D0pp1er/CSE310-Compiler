yacc -d -y 1905028.y
echo 'Generated the parser C file as well the header file'
g++ -ggdb3 -w -c -o y.o y.tab.c
flex 1905028.l
echo 'Generated the scanner C file'

g++ -ggdb3 -w -c -o l.o lex.yy.c
echo 'Generated the scanner object file'

g++ -ggdb3 y.o l.o -ll -o a
echo 'All ready, running'

./a $1

echo "Assembled $1"


