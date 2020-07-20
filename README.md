# Handy bash scripts

## Installation

1. Save the scripts somewhere in your directory. For instance `~/code/shell_scripts/`

2. Add to your `~/.zshrc` or `~/.bashrc` (depending on your shell)

```{bash}
alias header="SOME_DIR/header.sh"
alias search="SOME_DIR/search.sh"
```

## Use

### header.sh

*header* transposes the header the header row of a csv file.


The script takes three arguments:

1. path to a csv file (str)
2. field separator (str, optional, default=',')
3. header's line number (int, optional, default='1')

**Syntax**
```{bash}
header A_CSV_FILE.csv [FIELD_SEP] [HEADER_LINE_NUMBER]
```

### search.sh

*search* looks up for a string in files' content inside a directory and print all the lines containing the string.

The script takes two arguments:

1. pattern to look for (str, can be regex expression)
2. regex for filename (str, optional, default='*')

**Syntax**
```{bash}
search REGEX [REGEX_FILENAME]
```


**Example**
```{bash}
search 'hello*world' *.py
```

