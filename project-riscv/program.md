# Program.s RISC-V Assembly

This program reads a C program from standard input (stdin) and stores it in the input_buf buffer. It then initializes a lexical analyzer with the input_buf buffer and the identifiers array as the output buffer, and uses the lexical analyzer to extract the identifiers from the C program.

Next, it initializes a hash table with the hash_table array and the ht_init function. It then iterates through the list of identifiers and looks up each identifier in the hash table using the ht_lookup function. If the identifier is not found in the hash table, it calls a function min_chars to determine the minimum number of characters required to preserve the identifier's uniqueness. It then adds 1 to this value (to ensure that the modified identifier is at least as long as the maximum length of a C language keyword) and stores the modified identifier in the modified array and the hash table using the ht_insert function.

Finally, the program displays the replacement list by calling the display_replacement_list function with the modified array and its size.

Placeholders: 
- lex_init, 
- lex_identifiers, 
- ht_init, 
- ht_lookup, 
- min_chars,
- ht_insert

Need to consult the documentation for the lexical analyzer and hash table library that I'm using to learn how to use these functions.

# Lexical Analyzer
A lexical analyzer (also known as a lexer or tokenizer) is a software component that performs lexical analysis, which is the process of breaking down a stream of input text into smaller units called tokens. In the context of a RISC-V assembly program, a lexical analyzer can be used to parse a C program and extract the individual identifiers, keywords, punctuation, and other elements that make up the program's source code.

RISC-V assembly programs can use a lexical analyzer by calling functions provided by the lexical analyzer to initialize it, get the next token from the input text, and perform other operations. The exact details of how to use a lexical analyzer in a RISC-V assembly program will depend on the specific lexical analyzer that is being used. Need to consult the documentation for the lexical analyzer to learn how to use it in the RISC-V assembly program.

# Compile
This compiler is part of the RISC-V GNU Toolchain.

## Transform to object file
```riscv64-unknown-elf-gcc -c program.s -o program.o```

## Link
```riscv64-unknown-elf-ld program.o -o program```


