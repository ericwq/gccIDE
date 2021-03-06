# Deprecated

`gccIDE` is merged to [nvide](https://github.com/ericwq/nvide). 

# gccIDE

A neovim based GCC/G++ IDE, based on [alpine](https://www.alpinelinux.org/) linux, c/c++ language server enabled, syntax highlight IDE. Just pull docker image from [hub.docker.com](https://hub.docker.com/r/ericwq057/goccide) and run it.

For me [golangIDE](https://github.com/ericwq/golangIDE) is a good development environment for go language. I still need a c/c++ language development environment.

## Feature

Both GCC and CLANG is ready for use. The default compiler is GCC. Both clangd and ccls is ready. The default language server is ccls. If you prefers clangd, please refer to [switch clangd](../../wiki/switch-clangd).

- [neovim](https://neovim.io) - Vim-fork focused on extensibility and agility.
- [g++](https://gcc.gnu.org) - GNU C++ standard library and compiler.
- [gcc](https://gcc.gnu.org) - The GNU Compiler Collection.
- [clang](https://llvm.org/) - A C language family front-end for LLVM.
- [make](https://www.gnu.org/software/make) - GNU make utility to maintain groups of programs
- [cmake](https://www.cmake.org/) - Cross-platform, open-source make system.
- [bear](https://github.com/rizsotto/Bear) - Bear is a tool that generates a compilation database for clang tooling.
- [bash](https://www.gnu.org/software/bash/bash.html) - The GNU Bourne Again shell.
- [git](https://www.git-scm.com/) - Distributed version control system
- [htop](https://htop.dev/) - Interactive process viewer.
- [ccls](https://github.com/MaskRay/ccls) - C/C++/ObjC language server supporting cross references, hierarchies, completion and semantic highlighting.
- [clangd](https://clangd.llvm.org/) - clangd is a language server, and provides C++ IDE features to editors.
- [cpplint](https://github.com/cpplint/cpplint) - Static code checker for C++.
- [coc.nvim](https://github.com/neoclide/coc.nvim) - Nodejs extension host for vim & neovim, load extensions like VSCode and host language servers.
  - [coc-json](https://github.com/neoclide/coc-json) - Json language extension for coc.nvim.
  - [coc-snippets](https://github.com/neoclide/coc-snippets) - Snippets solution for coc.nvim.
  - [coc-pairs](https://github.com/neoclide/coc-pairs) - Basic auto pairs extension of coc.nvim.
  - [coc-markdownlint](https://github.com/fannheyward/coc-markdownlint) - markdownlint extension for coc.nvim.
- [protoc](https://developers.google.com/protocol-buffers/docs/downloads) - protocol buffer compiler
- [fzf](https://github.com/junegunn/fzf) - A command-line fuzzy finder.
- [ripgrep](https://github.com/BurntSushi/ripgrep) - ripgrep recursively searches directories for a regex pattern while respecting your gitignore.
- [crusoexia/vim-monokai](https://github.com/crusoexia/vim-monokai) - Refined Monokai color scheme for vim, inspired by Sublime Text.
- [ekalinin/Dockerfile.vim](https://github.com/ekalinin/Dockerfile.vim) - Vim syntax file & snippets for Docker's Dockerfile.
- [itchyny/lightline.vim](https://github.com/itchyny/lightline.vim) - A light and configurable statusline/tabline plugin for Vim.
- [preservim/nerdtree](https://github.com/preservim/nerdtree)- A tree explorer plugin for vim.
- [preservim/tagbar](https://github.com/preservim/tagbar) - Vim plugin that displays tags in a window, ordered by scope.
- [junegunn/fzf](https://github.com/junegunn/fzf) - ???? A command-line fuzzy finder.
- [junegunn/fzf.vim](https://github.com/junegunn/fzf.vim) - fzf ??????  vim.
- [jackguo380/vim-lsp-cxx-highlight](https://github.com/jackguo380/vim-lsp-cxx-highlight) - Vim plugin for C/C++/ObjC semantic highlighting using cquery, ccls, or clangd.

Please suggest any software which deserved to be integrated into this IDE.

## Quick guide

```sh
% docker pull ericwq057/gccide:latest

% docker run -it -d -h gccide  --env TZ=Asia/Shanghai  --name gcc \
  --mount source=proj-vol,target=/home/ide/proj \
  --mount type=bind,source=YOUR-SHARED-DIRECTORY,target=/home/ide/develop \
  gccide:latest

$ docker exec -u ide -it gcc bash
```

- `YOUR-SHARED-DIRECTORY` is you local source code directory shared with native OS. E.g. "/Users/qiwang/dev".
- You may need to create a docker volume `proj-vol` first:

```sh
% docker volume create proj-vol
```

- `proj-vol` is also your source code directory, which you don't need to access from native OS. It's faster comparing with shared one.
- Check `% ls /usr/share/zoneinfo` to get the TZ value for your location.

## Reference

- [Modern C++ development in (Neo)vim](https://chmanie.com/post/2020/07/17/modern-c-development-in-neovim/)
- [Configure coc.nvim for C/C++ Development](https://ianding.io/2019/07/29/configure-coc-nvim-for-c-c++-development/)
- [Set up for C++/C Development in Neovim](https://jdhao.github.io/2020/04/19/nvim_cpp_and_c_completion/)

## Notes

If you want to use docker to develop kernel module or device driver. Don't do that. Use virtualbox or vmware instead.

- [Is it possible to use a kernel module built from within Docker?](https://stackoverflow.com/questions/54479529/is-it-possible-to-use-a-kernel-module-built-from-within-docker)
- [docker linux container doesn't support driver development?](https://stackoverflow.com/questions/42921503/docker-linux-container-doesnt-support-driver-development)
- [Containers are not VMs](https://www.docker.com/blog/containers-are-not-vms/)

## Status

- Working on detail guide.
- The gccIDE is verified by [ccls](https://github.com/MaskRay/ccls) - A C++ project, by both ccls and clangd. See [ccls project](../../wiki/ccls-project) for detail.
- The gccIDE is verified by [ldd3](https://github.com/martinezjavier/ldd3) - A C project, See [ldd3 project](../../wiki/ldd3-project) for detail.
