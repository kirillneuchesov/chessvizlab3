#include <stdio.h>
#include<locale.h>
#include <stdlib.h>
#include "board_read.h"
#include "board_print_plain.h"
#include "board.h"
int main()
{
char  a[9][9];
int y=1;
setlocale(LC_ALL,"Rus");
boardbuild(a);
boardprint(a);
do{
printf("\nMake a move\n");
move(a);
system("clear");
boardprint(a);
printf("\nWill continue the game (1-Yes, 0-No)\n");
scanf("%d",&y);
}while(y);
return 0;
}
