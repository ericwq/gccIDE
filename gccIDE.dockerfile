FROM alpine:3.13 AS cclsBuild
LABEL maintainer="ericwq057@qq.com"

# download and compile ccls
#
# https://github.com/MaskRay/ccls/wiki/Build#system-specific-notes
#
RUN apk add alpine-sdk cmake make clang clang-static clang-dev llvm-dev llvm-static \
	&& git clone --depth=1 --recursive https://github.com/MaskRay/ccls \
	&& cd ccls \
	&& cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release \
	&& cmake --build Release --target install


FROM alpine:3.13
LABEL maintainer="ericwq057@qq.com"

# fetch the ccls binanry from the previous build stage
#
COPY --from=cclsBuild /usr/local/bin/ccls /usr/local/bin/ccls

# This is the runtime package it contains
# base: bash colordiff git curl neovim tzdata htop
#
# for neovim environment: 
#   python3 for coc python provider
#   nodejs-current and npm for noodejs provider
RUN apk add --no-cache \
	g++ \
	musl-dev \
	cmake \
	make \
	llvm \
	colordiff \
        bash \
        neovim \
        git \
        curl \
        ctags \
        nodejs-current \
        npm \
        tzdata \
        htop \
        protoc \
	py3-pip \
	ripgrep \
	fzf 

SHELL ["/bin/bash", "-c"]

ENV HOME /home/ide
#ENV GOPATH /go

# Create user/group : ide/develop
RUN addgroup develop && adduser -D -h $HOME -s /bin/bash -G develop ide
#RUN chown -R ide:develop $GOPATH

USER ide:develop
WORKDIR $HOME

# Prepare for the nvim
RUN mkdir -p $HOME/.config/nvim/ && \
	mkdir -p $HOME/.config/nvim/plugged && \
	mkdir -p $HOME/.config/nvim/config && \
	mkdir -p $HOME/.config/coc/extensions

# Install vim-plug
# https://github.com/junegunn/vim-plug
WORKDIR $HOME
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

## Copy the init.vim 
COPY --chown=ide:develop ./config/init0.vim 		$HOME/.config/nvim/init.vim

# Install all the vim-plug plugins
RUN nvim --headless -c 'PlugInstall' -c qall

## Copy the init.vim 
COPY --chown=ide:develop ./config/init.vim 		$HOME/.config/nvim/init.vim

# Prepare the coc, and others config file
COPY --chown=ide:develop ./config/neo.vim 		$HOME/.config/nvim/config/neo.vim
COPY --chown=ide:develop ./config/coc.vim 		$HOME/.config/nvim/config/coc.vim
COPY --chown=ide:develop ./config/others.vim 		$HOME/.config/nvim/config/others.vim

# Prepare the coc-settings.json and package.json
COPY --chown=ide:develop ./config/package.json 		$HOME/.config/coc/extensions/package.json
COPY --chown=ide:develop ./config/coc-settings.json 	$HOME/.config/nvim/coc-settings.json


USER root
RUN 	apk add --no-cache --virtual .build-deps python3-dev \
# Install neovim python provider pynvim
	&& su  ide -c 'pip3 install pynvim cpplint' \
	&& apk del --no-network .build-deps
USER ide:develop

# Install COC extension: coc-json coc-snippets
WORKDIR  $HOME/.config/coc/extensions
RUN nvim --headless -c 'CocInstall -sync coc-json coc-snippets coc-pairs coc-markdownlint' -c qall &&\
	npm cache clean --force


# create the empty proj directory for volume mount
RUN mkdir -p $HOME/proj

# Setup the shell environement
RUN touch $HOME/.bash_profile && \
	echo 'if [ -f ~/.bashrc ]; then . ~/.bashrc; fi' >> $HOME/.bash_profile
RUN touch $HOME/.bashrc && \
	echo >> $HOME/.bashrc && \
 	echo 'export LANG=en_US.UTF-8' >> $HOME/.bashrc  && \
	echo 'export PATH=$PATH' >> $HOME/.bashrc  && \
	echo 'alias vi=nvim' >> $HOME/.bashrc && \
	echo "export PS1='\u@\h:\w $ '" >> $HOME/.bashrc

WORKDIR $HOME

CMD ["/bin/bash"]
