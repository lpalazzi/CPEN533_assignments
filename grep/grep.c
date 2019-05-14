#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include "functions.h"

int main(int argc, char *argv[])
{
    
    // check for correct arguments
    if (argc != 4 && argc != 2) {
        printf("Incorrect arguments, use ./grep -h command for usage\n");
        exit(1);
    } 
    else if (strcmp(argv[1], "-h") == 0 && argv[2] == NULL) {
        usage();
        exit(1);
    }

    // save arguments in variables
    char *optionFlag = argv[1];
    char *regexp = argv[2];
    char *fileName = argv[3];

    // set options flags
    bool flag_n = false;
    if (strcmp(optionFlag, "-n") == 0) {
        flag_n = true;
    } else {
        printf("Invalid option flag, use ./grep -h command for usage\n");
        exit(1);
    }

    // read from file
    FILE *file;
    if (( file = fopen(fileName, "r") ) == NULL) {
        printf("Can't open file %s\n", fileName);
        exit(1);
    }

    int nmatch = search_in_file(regexp, file);
    
    fclose(file);



    return 0;
}
