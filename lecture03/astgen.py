import ast
import sys
import os
from graphviz import Digraph

def ast_to_graph(node, graph=None, parent=None):
    if graph is None:
        graph = Digraph()
    
    node_label = type(node).__name__
    if isinstance(node, ast.AST):
        fields = []
        for name, value in ast.iter_fields(node):
            if isinstance(value, (str, int, float)):
                fields.append(f"{name}={value}")
        if fields:
            node_label += "\n" + ", ".join(fields)
    
    this_id = str(id(node))
    graph.node(this_id, node_label, shape="box")
    
    if parent is not None:
        graph.edge(parent, this_id)
    
    if isinstance(node, ast.AST):
        for child in ast.iter_child_nodes(node):
            ast_to_graph(child, graph, this_id)
    
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

    # Generate output name based on input file
    base, _ = os.path.splitext(filename)
    outname = f"{base}_ast"

    graph.render(outname, format="png", cleanup=True)
    print(f"AST graph saved as {outname}.png")
