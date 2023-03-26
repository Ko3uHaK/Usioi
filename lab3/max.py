INF = float('inf')
def bfs(matrix, s, t, parent):
    visited = [False] * len(matrix) 
    queue = [s]                     
    visited[s] = True

    while queue:
        u = queue.pop(0)
        for ind, val in enumerate(matrix[u]):
            if not visited[ind] and val > 0:
                visited[ind] = True
                parent[ind] = u
                queue.append(ind)

    return True if visited[t] else False

def main(matrix, s, t):
    residual_matrix = [row[:] for row in matrix]

    parent = [-1] * len(matrix) 

    max_flow = 0 

    while bfs(residual_matrix, s, t, parent):
        path_flow = INF

        v = t
        while v != s:
            u = parent[v]
            path_flow = min(path_flow, residual_matrix[u][v])
            v = u

        v = t
        while v != s:
            u = parent[v]
            residual_matrix[u][v] -= path_flow
            residual_matrix[v][u] += path_flow
            v = u
        max_flow += path_flow

    return max_flow