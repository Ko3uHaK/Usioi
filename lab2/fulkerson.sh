
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

    while [[ ${#queue[@]} -ne 0 ]]; do
    local u=${queue[0]}
    unset queue[0]
    for v in "${!network[@]}"; do
      local capacity=${network[$v]}
      if [[ $capacity -gt 0 && ! ${visited[*]} =~ $v ]]; then
        queue+=("$v")
        parent[$v]=$u
        visited+=("$v")
      fi
    done
  done

    if [[ ${visited[*]} =~ t ]]; then
    echo ${parent[*]}
  else
    echo ""
  fi
}

function augment_flow {
  local path=("$@")
  local bottleneck=1000000
  local u t

  t=${path[t]}
  u=${path[$t]}
  while [[ $u -ne -1 ]]; do
    local capacity=${network["$u,$t"]}
    bottleneck=$(( capacity < bottleneck ? capacity : bottleneck ))
    t=$u
    u=${path[$t]}
  done

  t=${path[t]}
  u=${path[$t]}
  while [[ $u -ne -1 ]]; do
    local capacity=${network["$u,$t"]}
    network["$u,$t"]=$(( capacity - bottleneck ))
    network["$t,$u"]=$(( ${network["$t,$u"]} + bottleneck
    