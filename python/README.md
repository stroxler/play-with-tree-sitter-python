# Setup instructions

Install a virtualenv:
```
pyenv install 3.10.5
export PYENV_VERSIOn=3.10.5
pyenv virtualenv pwtsp
pip install -r requirements.txt
```

Then, clone the tree-sitter-python setup build the tree sitter native library:
```
bash build_tree_sitter.sh
```

At this point you should be able to test it out interactively, e.g. in an `ipython`
shell:
```
from pwtsp.explore import parse_code

parse_code("""
def f(x: int) -> int:
   return x
""").root_node.sexp()
```

