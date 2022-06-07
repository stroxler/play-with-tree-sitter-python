BIN=./vendor/ocaml-tree-sitter-core/bin
SCRIPTS=./vendor/ocaml-tree-sitter-core/scripts
export PATH=$PATH:$BIN

# This needs to be in the working directory, or else the
# scripts (which are built with semgrep's needs in mind) will
# go looking for the grammar in a path that is meaningless to
# our project.
cp ./vendor/tree-sitter-python/grammar.js .

# This generates the `ocaml-src` folder
$SCRIPTS/ocaml-tree-sitter-gen-ocaml --lang python

# The code generator seems to miss this
cp vendor/tree-sitter-python/src/scanner.cc ocaml-src/lib/
