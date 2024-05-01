#!/usr/bin/env bash

set -xeuo pipefail

export XDG_CONFIG_HOME=.
export XDG_STATE_HOME=./state
export XDG_DATA_HOME=./data

mkdir -p "$XDG_DATA_HOME" "$XDG_STATE_HOME"

nvim
