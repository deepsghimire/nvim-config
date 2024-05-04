#!/usr/bin/env bash

set -xeuo pipefail

DIR="${0%/*}/.."
export XDG_CONFIG_HOME=$DIR
export XDG_STATE_HOME=$DIR/state
export XDG_DATA_HOME=$DIR/data

mkdir -p "$XDG_DATA_HOME" "$XDG_STATE_HOME"

nvim
