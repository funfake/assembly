#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <ctype.h>

struct identifier
{
    char *name;
    char *replacement;
};

int min_chars_for_uniqueness(struct identifier *identifiers, int num_identifiers)
{
    // Create a set of all the prefixes of the identifiers
    char *prefixes[num_identifiers];
    int num_prefixes = 0;
    for (int i = 0; i < num_identifiers; i++)
    {
        int len = strlen(identifiers[i].name);
        for (int j = 0; j < len; j++)
        {
            prefixes[num_prefixes++] = strndup(identifiers[i].name, j + 1);
        }
    }

    // Sort the prefixes
    qsort(prefixes, num_prefixes, sizeof(char *), (int (*)(const void *, const void *))strcmp);

    // Count the number of unique prefixes
    int num_unique_prefixes = 1;
    for (int i = 1; i < num_prefixes; i++)
    {
        if (strcmp(prefixes[i], prefixes[i - 1]) != 0)
        {
            num_unique_prefixes++;
        }
    }

    // Free the memory allocated for the prefixes
    for (int i = 0; i < num_prefixes; i++)
    {
        free(prefixes[i]);
    }

    // Return the number of characters required to make all the identifiers unique
    return num_unique_prefixes;
}

int main(int argc, char **argv)
{
    if (argc != 2)
    {
        fprintf(stderr, "Usage: %s program.c\n", argv[0]);
        return 1;
    }

    // Read the C program
    FILE *fp = fopen(argv[1], "r");
    if (fp == NULL)
    {
        perror("Error opening file");
        return 1;
    }
    fseek(fp, 0, SEEK_END);
    long fsize = ftell(fp);
    fseek(fp, 0, SEEK_SET);
    char *program = malloc(fsize + 1);
    fread(program, fsize, 1, fp);
    fclose(fp);
    program[fsize] = '\0';

    // Extract all the identifiers from the program
    struct identifier identifiers[1024];
    int num_identifiers = 0;
    char *p = program;
    while (*p)
    {
        if (isalpha(*p) || *p == '_')
        {
            char *q = p + 1;
            while (isalnum(*q) || *q == '_')
            {
                q++;
            }
            int len = q - p;
            identifiers[num_identifiers].name = strndup(p, len);
            num_identifiers++;
            p = q;
        }
        else
        {
            p++;
        }
    }

    // Determine the minimum number of characters required to make all the identifiers unique
    int min_chars = min_chars_for_uniqueness(identifiers, num_identifiers);

    // Create a replacement list for the identifiers
    for (int i = 0; i < num_identifiers; i++)
    {
        identifiers[i].replacement = strndup(identifiers[i].name, min_chars);
    }

    // Print the replacement list
    for (int i = 0; i < num_identifiers; i++)
    {
        printf("%s => %s\n", identifiers[i].name, identifiers[i].replacement);
    }

    // Free the memory allocated for the identifiers
    for (int i = 0; i < num_identifiers; i++)
    {
        free(identifiers[i].name);
        free(identifiers[i].replacement);
    }

    // Free the memory allocated for the program
    free(program);

    return 0;
}
