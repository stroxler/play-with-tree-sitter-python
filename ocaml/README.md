# Setup instructions

Note: these instructions were tested against commit
ae47b86e4e9d8b85e97affa7904ce43b96439b3d of ocaml-tree-sitter-core,
and on a system where the following were already installed:
- node 16.0.0 (installed via nvm)
- cargo 1.61.0 (installed via rustup.rs)
- bash 5.1.12 (installed via nix-env)
- pkg-config 0.29.2 (installed via brew, I think, but not sure TBH)


Run
```
bash vendor-repos.sh
```
to grab copies of the ocaml-tree-sitter-core and tree-sitter-python
dependencies.

Then, run `build-ocaml-tree-sitter.sh` to build the ocaml generator
and library. This by the way works against 4.10.2 just fine.

Then run `build-python-parser` to build the generated ocaml code.

# Fixing the build

The builds don't seem to work for me out of the box.

First off, if you don't set `--lang python` you'll get tons of name mismatch
errors; the code generator doesn't appear to be consistent if there's a
mismatch between `grammar.js` and the `--lang` flag. That was easy to fix
but took some time to find.

Secondly, the code generation skips a critical C++ source file, which causes
compilation of `parser.c` to fail.  To fix this, I had to copy `scanner.cc` out
of `tree-sitter-python` and into my `ocaml-src/lib` directory and then add it
to `ocaml-scr/lib/dune` underneat the `c_library_flags` directive:
```
  (foreign_stubs
    (language cxx)
    (names scanner)
    (flags -fPIC
           -I .)
  )
```


Something worth noting is that even though the semgrep repos suggest
ocaml 4.12.0, I actually get compilation failures if I use that version
of ocaml because it appears that recursive type aliases aren't allowed.
Specifically, on 4.12.0 (but not on 4.10.2) it complains about:
- `lambda_parameters`, which is just an alias for `parameters_`
- `type_`, which is just an alias for `expression`
- `which_item` which is just an alias for `type_` (so also `expression`)

# References


- The tree sitter core main page: https://github.com/returntocorp/ocaml-tree-sitter-core
  - The docs page: https://github.com/returntocorp/ocaml-tree-sitter-core/tree/main/doc
  - The overview: https://github.com/returntocorp/ocaml-tree-sitter-core/blob/main/doc/overview.md
- When debugging problems with the generated code
  - semgrep-python (in particular the lib/dune file): https://github.com/returntocorp/semgrep-python
  - tree-sitter-python, from which I took the scanner.cc generated C++ code


