#include <stdio.h>
#include "functions.h"

void usage () {
    printf("Usage: ./grep [OPTION] PATTERN [FILE]...\n   Search for PATTERN in FILE\n");
    //printf("   -c    Only print a count of the number of lines that match");
    //printf("   -h    Display the matched lines");
    printf("OPTIONS:\n");
    printf("   -n    Display the matched lines and their line numbers\n");
}

int search_in_file(char *regexp, FILE *fp) {
    // finds a regular expression in a text file
    // prints the matched strings to stdout
    // returns a count of the number of matches

    int c;

    while ((c = getc(fp)) != EOF) {
        putc(c, stdout);
    }

    return 0;
}