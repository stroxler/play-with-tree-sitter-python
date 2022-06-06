set -ex

if [[ ! -d 'vendor/ocaml-tree-sitter-core' ]]; then
	git clone git@github.com:returntocorp/ocaml-tree-sitter-core.git \
		vendor/ocaml-tree-sitter-core
fi

cd vendor/ocaml-tree-sitter-core

./scripts/rebuild-everything

# Using ocaml switch on 4.10.2 because that's currently what pyre needs,
# even though the returntocorp repos want 4.12 :(


