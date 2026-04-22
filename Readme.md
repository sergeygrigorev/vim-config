# How to use

Add this to your `.vimrc`/`.ideavimrc` file:

```vimscript
let g:PATH_TO_CONFIG = 'c:/path/to/this/repo/' " should end with slash
exec 'source ' . g:PATH_TO_CONFIG . '.vimrc' " or .ideavimrc
```
