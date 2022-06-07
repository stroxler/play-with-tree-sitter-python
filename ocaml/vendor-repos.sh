set -ex

if [[ ! -d 'vendor/ocaml-tree-sitter-core' ]]; then
	git clone git@github.com:returntocorp/ocaml-tree-sitter-core.git \
		vendor/ocaml-tree-sitter-core
fi

if [[ ! -d 'vendor/tree-sitter-python' ]]; then
  mkdir -p vendor
  git clone https://github.com/tree-sitter/tree-sitter-python vendor/tree-sitter-python
fi
