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
printf("\n������ ������ ���\n");
move(a);
boardprint(a);
printf("\n���������� ����? (1-��, 0-���)\n");
scanf("%d",&y);
}while(y);
return 0;
}
