# gccIDE

A neovim based GCC/G++ IDE in the docker environment. Based on alpine.

For me [golangIDE](https://github.com/ericwq/golangIDE) is a good development environment for go language. I still need a c/c++ language development environment also.

## Feature

- neovim
- g++
- make, cmake
- git
- ccls - c/c++ language server
- cpplint - c++ language lint
- coc.vim - nvim plugin
- coc-json - json plugin
- coc-snippets - snippets plugin
- coc-pairs - fast pairs plugin
- coc-markdownlint - markdonw lint
- protoc - protocol buffer compiler
- fzf - search file name
- ripgrep - serch file content
- 'crusoexia/vim-monokai' - color schema
- 'ekalinin/Dockerfile.vim' - nvim dockerfile plugin
- 'itchyny/lightline.vim' - nvim status bar
- 'preservim/nerdtree'- nvim file manager
- 'preservim/tagbar' - nvim tag bar
- 'jackguo380/vim-lsp-cxx-highlight' - syntex highlighting from ccls

## Reference

- [Modern C++ development in (Neo)vim](https://chmanie.com/post/2020/07/17/modern-c-development-in-neovim/)
- [Configure coc.nvim for C/C++ Development](https://ianding.io/2019/07/29/configure-coc-nvim-for-c-c++-development/)

## Status

Waiting for the real project verification. Currently the problem rise from [MaskRay/ccls](https://github.com/MaskRay/ccls/wiki/Project-Setup#ccls-file) project setup. Try to verifiy it with the following projects:

- [grpc/grpc](https://github.com/grpc/grpc) c/c++ project.
- [martinezjavier/ldd3](https://github.com/martinezjavier/ldd3) c project.
- [linux kernel](https://www.kernel.org/) c project. I hope so.
