#include "board_read.h"
void boardbuild ( char cell[9][9]) {
int o,p;
int u;
for (o=0; o<9; o++){
    for(p=0; p<9; p++){
    cell[o][p] = ' ';
    }
}
for (o=1; o<9; o++){
cell[1][o] = 'p';
}
for (o=0,u=8; o<8; o++,u--){
cell[o][0] = u + '0';
}
cell[0][1] = 'r'; cell[0][2] = 'n'; cell[0][3] = 'b'; cell[0][4] = 'q';
cell[0][5] = 'k'; cell[0][6] = 'b'; cell[0][7] = 'n'; cell[0][8] = 'r';
for (o=1; o<9; o++){
cell[6][o] = 'P';
}
cell[7][1] = 'R'; cell[7][2] = 'N'; cell[7][3] = 'B'; cell[7][4] = 'Q';
cell[7][5] = 'K'; cell[7][6] = 'B'; cell[7][7] = 'N'; cell[7][8] = 'R';
for (o=1,u=97; o<9;o++,u++){
cell[8][o] = u;
}
}
