#!/bin/bash

readonly INF=999999999 
readonly V=10           

ford_fulkerson() {

  local matrix=("$@")

  local parent=()

  for (( i=0; i<$V; i++ ))
  do
    parent[$i]=-1
  done

  local max_flow=0     


  while bfs "${matrix[@]}" "$2" "$3" "${parent[@]}"
  do
    local path_flow=$INF 


    for (( v=$3; v!=$2; v=${parent[$v]} ))
    do
      local u=${parent[$v]}
      if (( matrix[u*V+v] < path_flow ))
      then
        path_flow=${matrix[u*V+v]}
      fi
    done


    for (( v=$3; v!=$2; v=${parent[$v]} ))
    do
      local u=${parent[$v]}
      matrix[u*V+v]=$(( matrix[u*V+v] - path_flow ))
      matrix[v*V+u]=$(( matrix[v*V+u] + path_flow ))
    done


    max_flow=$(( max_flow + path_flow ))
  done

  echo "$max_flow"
}
bfs() {
  local visited=()

