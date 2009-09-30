volatile unsigned long microsPerPixelColumn = 10000;
unsigned long microsPerPixelEight = 0;
volatile unsigned long lastSpinTime = 0;
unsigned long lastColumnTime = 0;

int column = 0;
int row = 0;
int LEDEight = 0;

unsigned long inturruptDebounce = 100;

int eightpins[8] = {row0, row1, row2, row3, row4, row5, row6, row7}
int columns[8] = {col0, col1, col2, col3, col4, col5, col6, col7}

int pins[72][2] = {{col0, row0},
                    {col0, row1},
                    {col0, row2},
                    {col0, row3},
                    {col0, row4},
                    {col0, row5},
                    {col0, row6},
                    {col0, row7},
//                    {col0, row8},
//                    {col0, row9},
                    
                    {col1, row0},
                    {col1, row1},
                    {col1, row2},
                    {col1, row3},
                    {col1, row4},
                    {col1, row5},
                    {col1, row6},
                    {col1, row7},
//                    {col1, row8},
//                    {col1, row9},
                    
                    {col2, row0},
                    {col2, row1},
                    {col2, row2},
                    {col2, row3},
                    {col2, row4},
                    {col2, row5},
                    {col2, row6},
                    {col2, row7},
//                    {col2, row8},
//                    {col2, row9},
                    
                    {col3, row0},
                    {col3, row1},
                    {col3, row2},
                    {col3, row3},
                    {col3, row4},
                    {col3, row5},
                    {col3, row6},
                    {col3, row7},
//                    {col3, row8},
//                    {col3, row9},
                    
                    {col4, row0},
                    {col4, row1},
                    {col4, row2},
                    {col4, row3},
                    {col4, row4},
                    {col4, row5},
                    {col4, row6},
                    {col4, row7},
//                    {col4, row8},
//                    {col4, row9},
                    
                    {col5, row0},
                    {col5, row1},
                    {col5, row2},
                    {col5, row3},
                    {col5, row4},
                    {col5, row5},
                    {col5, row6},
                    {col5, row7},
//                    {col5, row8},
//                    {col5, row9},
                    
                    {col6, row0},
                    {col6, row1},
                    {col6, row2},
                    {col6, row3},
                    {col6, row4},
                    {col6, row5},
                    {col6, row6},
                    {col6, row7},
//                    {col6, row8},
//                    {col6, row9},
                    
                    {col7, row0},
                    {col7, row1},
                    {col7, row2},
                    {col7, row3},
                    {col7, row4},
                    {col7, row5},
                    {col7, row6},
                    {col7, row7},
//                    {col7, row8},
//                    {col7, row9},
                    
                    {col8, row0},
                    {col8, row1},
                    {col8, row2},
                    {col8, row3},
                    {col8, row4},
                    {col8, row5},
                    {col8, row6},
                    {col8, row7},
//                    {col8, row8},
//                    {col8, row9},
                    
//                    {col9, row0},
//                    {col9, row1},
//                    {col9, row2},
//                    {col9, row3},
//                    {col9, row4},
//                    {col9, row5},
//                    {col9, row6},
//                    {col9, row7},
//                    {col9, row8},
//                    {col9, row9}
                    };
                    
