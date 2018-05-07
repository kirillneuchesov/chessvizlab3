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
printf("\nМожете делать ход\n");
move(a);
boardprint(a);
printf("\nПродолжать игру? (1-да, 0-нет)\n");
scanf("%d",&y);
}while(y);
return 0;
}
