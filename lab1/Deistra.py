def d(graph, start_node):
    unvisited_nodes = list(graph.get_nodes())
    shortest_path = {}
    previous_nodes = {}
    max_value = sys.maxsize
    for node in unvisited_nodes:
        shortest_path[node] = max_value
    shortest_path[start_node] = 0
    while unvisited_nodes:
        current_min_node = None
        for node in unvisited_nodes:
            if current_min_node == None:
                current_min_node = node
            elif shortest_path[node] < shortest_path[current_min_node]:
                current_min_node = node
        neighbors = graph.get_outgoing_edges(current_min_node)
        for neighbor in neighbors:
            tentative_value = shortest_path[current_min_node] + graph.value(current_min_node, neighbor)
            if tentative_value < shortest_path[neighbor]:
                shortest_path[neighbor] = tentative_value
                previous_nodes[neighbor] = current_min_node
        unvisited_nodes.remove(current_min_node)
    return previous_nodes, shortest_path
nodes = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
our_graph = {}
for node in nodes:
    our_graph[node] = {}   
our_graph["1"]["2"] = 3
our_graph["1"]["4"] = 4
our_graph["2"]["3"] = 3
our_graph["3"]["4"] = 4
our_graph["3"]["5"] = 7
our_graph["3"]["8"] = 4
our_graph["4"]["6"] = 1
our_graph["4"]["8"] = 3
our_graph["5"]["7"] = 3
our_graph["6"]["8"] = 9
our_graph["7"]["8"] = 5
our_graph["7"]["9"] = 2
our_graph["7"]["10"] = 5
our_graph["8"]["9"] = 7
our_graph["9"]["10"] = 2
