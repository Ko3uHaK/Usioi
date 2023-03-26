
declare -A network=(
# Тут я вношу свои вершины, к примеру [s,1]=0 [s,2]=6
)

function find_augmenting_path {
  local parent=()
  local queue=()
  local visited=()

  queue+=(s)
  visited+=(s)
  parent[s]=-1