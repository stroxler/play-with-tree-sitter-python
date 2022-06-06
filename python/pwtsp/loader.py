import os
from tree_sitter import Language, Parser

package_root = os.path.dirname(__file__)
project_root = os.path.dirname(package_root)
native_root = os.path.join(project_root, "native")

native_lib = os.path.join(native_root, "tree-sitter-python.so")

language = Language(native_lib, 'python')
parser = Parser()
parser.set_language(language)
