# ECOAR RISC-V Project 13

## Student
William BRISA / K-6836 / WUT / Winter Semester 2022-2022

## Project instructions
Collect all the identifiers from a valid C program and determine the minimum number of characters required to preserve their uniqueness. Produce the replacement list and display it. Assume that the minimum length of a modified identifier is equal to or greater than the maximum length of a C language keyword.

## Steps
1. Parse the C program and extract all the identifiers. This can be done using a lexical analyzer or a parser.
2. Store all the identifiers in a data structure, such as an array or a hash table.
3. Iterate through the list of identifiers and determine the minimum number of characters required to preserve their uniqueness.
4. After determining the minimum number of characters required for each identifier, create a replacement list that maps the original identifiers to the modified versions.
5. Display the replacement list to the user.