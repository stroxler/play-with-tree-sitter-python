#!/usr/bin/env bash
set -ex

if [[ ! -d vendor/tree-sitter-python ]]; then
  mkdir -p vendor
  git clone https://github.com/tree-sitter/tree-sitter-python vendor/tree-sitter-python
fi

python <<< '
from tree_sitter import Language

Language.build_library(
    "native/tree-sitter-python.so",
    ["vendor/tree-sitter-python"],
)
'
