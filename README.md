# Purpose

This repo gives me a place to play around with tree sitter, which the Pyre
team is considering using as a parser in order to provide ide features like
autocomplete that require error handling (we currently use the CPython parser,
which is not error-tolerant).

I'm not sure what direction the work will go, but there are two conceptually
separate mini-projects I need to do:
- Explore the ocaml-tree-sitter library (in the ocaml-tree-sitter-semgrep repo)
  and understand how to generate an ocaml binary given a grammar.
- Explore the tree-sitter-python grammar and ideally be able to test it against
  the CPython parser to see if syntactically correct code parses the same
  (up to a well-defined translation layer).


Since the build steps may not be the same, I'm doing this in two separate
subprojects `python` and `ocaml`; as of this writing only the `python` side is
done.

See inside of each subproject for more information.
