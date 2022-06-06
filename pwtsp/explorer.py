from .loader import parser



def parse_code(code: str):
    tree = parser.parse(bytes(code, 'utf-8'))
    return tree
