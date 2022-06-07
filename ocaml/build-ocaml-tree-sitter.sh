
set -ex

if [[ ! -d 'vendor/ocaml-tree-sitter-core' ]]; then
	echo "You need to vendor the repos first (use vendor-repos.sh)"
fi

# I did this using my ocaml switch on 4.10.2 because that's currently what pyre
# needs, even though the returntocorp repos want 4.12 :(
cd vendor/ocaml-tree-sitter-core
./scripts/rebuild-everything
