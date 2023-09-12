#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_IDENTIFIER_LEN 100         // maximum length of an identifier
#define MIN_MODIFIED_IDENTIFIER_LEN 10 // minimum length of a modified identifier
#define NUM_KEYWORDS 32                // number of C language keywords

// list of C language keywords
const char *keywords[NUM_KEYWORDS] = {
    "auto", "break", "case", "char", "const", "continue", "default", "do",
    "double", "else", "enum", "extern", "float", "for", "goto", "if",
    "int", "long", "register", "return", "short", "signed", "sizeof", "static",
    "struct", "switch", "typedef", "union", "unsigned", "void", "volatile", "while"};

// structure to store an identifier and its modified version
typedef struct
{
    char identifier[MAX_IDENTIFIER_LEN]; // original identifier
    char modified[MAX_IDENTIFIER_LEN];   // modified identifier
} identifier_t;

// function prototypes
int read_identifiers(identifier_t *identifiers);
void modify_identifiers(identifier_t *identifiers, int num_identifiers);
int compare_identifiers(const void *a, const void *b);
int is_keyword(const char *identifier);

int main(void)
{
    identifier_t identifiers[MAX_IDENTIFIER_LEN]; // array to store identifiers
    int num_identifiers;                          // number of identifiers

    // read identifiers from input
    num_identifiers = read_identifiers(identifiers);

    // modify identifiers to ensure uniqueness
    modify_identifiers(identifiers, num_identifiers);

    // sort identifiers by modified version
    qsort(identifiers, num_identifiers, sizeof(identifier_t), compare_identifiers);

    // print replacement list
    printf("Replacement list:\n");
    for (int i = 0; i < num_identifiers; i++)
    {
        printf("%s -> %s\n", identifiers[i].identifier, identifiers[i].modified);
    }

    return 0;
}

// reads identifiers from input and returns the number of identifiers
int read_identifiers(identifier_t *identifiers)
{
    int num_identifiers = 0; // number of identifiers
    char c;                  // current character being read

    // read characters from input until EOF
    while ((c = getchar()) != EOF)
    {
        // if character is alphabetic or underscore, it may be the start of an identifier
        if (isalpha(c) || c == '_')
        {
            // read identifier into buffer
            char buffer[MAX_IDENTIFIER_LEN];
            int i = 0;
            buffer[i++] = c;
            while (isalnum(c = getchar()) || c == '_')
            {
                buffer[i++];
                // add null terminator to buffer
                buffer[i] = '\0';

                // check if identifier is a C language keyword
                if (!is_keyword(buffer))
                {
                    // store identifier in array
                    strcpy(identifiers[num_identifiers].identifier, buffer);
                    num_identifiers++;
                }
            }
        }

        return num_identifiers;
    }

    // modifies the given identifiers to ensure uniqueness
    void modify_identifiers(identifier_t * identifiers, int num_identifiers) 
    {
        for (int i = 0; i < num_identifiers; i++)
        {
            char *identifier = identifiers[i].identifier; // original identifier
            char *modified = identifiers[i].modified;     // modified identifier

            // if the original identifier is already long enough, use it as the modified version
            if (strlen(identifier) >= MIN_MODIFIED_IDENTIFIER_LEN)
            {
                strcpy(modified, identifier);
                continue;
            }

            // otherwise, append enough underscores to the original identifier to make it long enough
            strcpy(modified, identifier);
            int len = strlen(modified);
            while (len < MIN_MODIFIED_IDENTIFIER_LEN)
            {
                modified[len++] = '_';
            }
            modified[len] = '\0';
        }
    }

    // compares two identifiers by their modified versions
    int compare_identifiers(const void *a, const void *b)
    {
        const identifier_t *ia = (const identifier_t *)a;
        const identifier_t *ib = (const identifier_t *)b;
        return strcmp(ia->modified, ib->modified);
    }

    // returns 1 if the given identifier is a C language keyword, 0 otherwise
    int is_keyword(const char *identifier)
    {
        for (int i = 0; i < NUM_KEYWORDS; i++)
        {
            if (strcmp(identifier, keywords[i]) == 0)
            {
                return 1;
            }
        }
        return 0;
    }
