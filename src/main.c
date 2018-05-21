#include <stdio.h>
#include <stdlib.h>
#include "board.h"
#include <locale.h>

int main()
{
	setlocale(LC_ALL, "Rus");
    system("cls");
    int i = 0,ext;
    char places[6];
    
    while ( i == 0) {
        char q;
        printf("Для начала нажмите (S) для выхода (Q)\n");
        scanf("%c", &q);
        
        if (q == 's') {
            system("cls");
		    print_new_board();
            while (ext == 0) {
                printf("Введите координаты или нажмите (Q) для выхода:\n" );
                scanf("%s", places);
                if (places[0] == 'q') {
					system("cls");
					printf("Игра окончена\n");
                    return 0;
                } else {
                    ext = board_func(places, 0);
                    if (ext == -1) {
                        printf("Неверные координаты\n");
                        ext = 0;
                    }
                }
            }
        } else if (q == 'q') {
            system("cls");
            printf("Игра окончена\n");
            return 0;
        }
    }
    return 0;
}

