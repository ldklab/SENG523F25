import ast
import sys
import os
from graphviz import Digraph

def ast_to_graph(node, graph=None, parent=None):
    if graph is None:
        graph = Digraph()

    # Default label: type of node
    node_label = type(node).__name__

    # Special case for Name: include id and ctx in label
    if isinstance(node, ast.Name):
        ctx = type(node.ctx).__name__ if hasattr(node, "ctx") else ""
        node_label += f'\n id="{node.id}" ctx={ctx}'

    # Special case for Constant: show value
    elif isinstance(node, ast.Constant):
        node_label += f'\n value={node.value!r}'

    this_id = str(id(node))
    graph.node(this_id, node_label, shape="box")

    if parent is not None:
        graph.edge(parent, this_id)

    # Recurse, but skip ctx
    if isinstance(node, ast.AST):
        for field, value in ast.iter_fields(node):
            if field == "ctx":  # skip ctx
                continue
            if isinstance(value, list):
                for item in value:
                    if isinstance(item, ast.AST):
                        ast_to_graph(item, graph, this_id)
            elif isinstance(value, ast.AST):
                ast_to_graph(value, graph, this_id)

    return graph

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print(f"Usage: python {sys.argv[0]} <python_file>")
        sys.exit(1)

    filename = sys.argv[1]
    with open(filename, "r") as f:
        code = f.read()

    tree = ast.parse(code, filename=filename)
    graph = ast_to_graph(tree)

    base, _ = os.path.splitext(filename)
    outname = f"{base}_ast"
    graph.render(outname, format="png", cleanup=True)
    print(f"AST graph saved as {outname}.png")
