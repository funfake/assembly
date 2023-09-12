# This program uses a regular expression to extract all the identifiers from the C program, 
# and then uses a helper function min_chars_for_uniqueness to determine the minimum number of characters 
# required to make all the identifiers unique. 
# Finally, it creates a replacement list for the identifiers and prints it.
import re

def min_chars_for_uniqueness(identifiers):
  """
  Returns the minimum number of characters required to make all
  the given identifiers unique.
  """
  # Create a set of all the prefixes of the identifiers
  prefix_set = set()
  for identifier in identifiers:
    for i in range(1, len(identifier) + 1):
      prefix_set.add(identifier[:i])

  # Return the number of characters required to make all the identifiers unique
  return len(prefix_set)

def main():
  # Read the C program
  with open("program.c", "r") as f:
    program = f.read()

  # Extract all the identifiers from the program
  identifiers = re.findall(r'\b[a-zA-Z_][a-zA-Z0-9_]*\b', program)

  # Determine the minimum number of characters required to make all the identifiers unique
  min_chars = min_chars_for_uniqueness(identifiers)

  # Create a replacement list for the identifiers
  replacements = {}
  for identifier in identifiers:
    replacements[identifier] = identifier[:min_chars]

  # Print the replacement list
  for old, new in replacements.items():
    print(f"{old} => {new}")

if __name__ == "__main__":
  main()