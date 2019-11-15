#!/bin/bash
set -eu

curl -sSL https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz | sudo tar -zxv -C /usr/local --strip 1
