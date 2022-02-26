# j2-nvim [![style checks](https://github.com/malinoskj2/j2-nvim/actions/workflows/check-style.yml/badge.svg?branch=main)](https://github.com/malinoskj2/j2-nvim/actions/workflows/check-style.yml)

My Neovim configuration.

## Install

1. Install externally managed [dependencies](#external-dependencies)
2. Clone repo and run the following

```zsh
# Downloads/Compiles internally managed dependencies
$ ./scripts/install

# Open Neovim :)
$ nvim
```

## Dependencies

Most dependencies are plugins which are managed via [packer](https://github.com/wbthomason/packer.nvim). Language servers are installed automatically via [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer). At the moment the config still depends on some binaries being available in the enviroment [see below](#external-dependencies).

### External Dependencies

- [Neovim v0.7.0-dev](https://github.com/neovim/neovim) (I just build master)
- [LuaJIT](https://luajit.org/)
- [Stylua](https://github.com/johnnymorganz/stylua)
- [Node.js](https://nodejs.org)
- [prettier](https://prettier.io/)
- [eslint_d](https://github.com/mantoni/eslint_d.js/)
- [PHP](https://www.php.net/)
- [PHP_CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer)
- [nixfmt](https://github.com/serokell/nixfmt)
- [fd](https://github.com/sharkdp/fd)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [Git](https://git-scm.com/)
