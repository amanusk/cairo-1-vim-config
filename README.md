# Config Cairo 1.0 in vim

Currently added:

- Syntax highlight
- Auto-format
- Language-server

## Synatx highlight

Copy the file `cairo.vim` to `.vim/synatx/`

Add the following lines to `.vimrc`

```
" some cairo config
au BufReadPost *.cairo set filetype=cairo
au Filetype cairo set syntax=cairo
```

## Auto format

Install latest `Scarb`, perferably with [asdf](https://docs.swmansion.com/scarb/download.html#install-via-asdf)

```
asdf install scarb latest
```

Add this autocmd to your `.vimrc`

```
" cairo 1.0
:autocmd BufWritePost *.cairo silent ! /home/<USER>/.asdf/shims/scarb fmt
```

## Language server

You need to have [coc.nvim](https://github.com/neoclide/coc.nvim) installed

Install latest `Scarb`, perferably with [asdf](https://docs.swmansion.com/scarb/download.html#install-via-asdf)

```
asdf install scarb latest
```

Add this to your `coc-settings.json`

```
  "languageserver": {
    "cairo": {
      "command": "/home/<USER>/.asdf/shims/scarb",
      "args": ["cairo-language-server"],
      "filetypes": ["cairo"]
    }
  },
```

![screenshot](./assets/2024-08-04_13-28.png)
