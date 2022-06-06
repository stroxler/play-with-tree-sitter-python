# Setup instructions

Note: these instructions were tested against commit
c4b8fc728f353d1a0ffcc6205f593276f2a41d0a of ocaml-tree-sitter-semgrep,
and on a system where the following were already installed:
- node 16.0.0 (installed via nvm)
- cargo 1.61.0 (installed via rustup.rs)
- bash 5.1.12 (installed via nix-env)
- pkg-config 0.29.2 (installed via brew, I think, but not sure TBH)


Build the `tree-sitter` and `ocaml-tree-sitter` cli tools by running
`build-ocaml-tree-sitter.sh`. It appears to me that this does work
against ocaml 4.10.2, which is important since Pyre is, for now, stuck
on an old compiler version due to shared-memory perf issues.

I haven't yet tried actually creating the python parser yet.
