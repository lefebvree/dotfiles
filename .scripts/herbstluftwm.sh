#!/usr/bin/env bash

active='%{u#c8ccd4 +u}%{B#3e4451}'
reset='%{u#353b45 +u}%{B#282c34}'

workspace_count=$(($(herbstclient get_attr tags.count)-1))
focus=$(herbstclient get_attr tags.focus.index)

names=(     )
output="$reset"

for i in `seq 0 $workspace_count`
do
	indicator=$([ $(herbstclient get_attr tags.$i.client_count) == 0  ] && echo "  " || echo "。")
	if [ "$i" -eq "$focus" ]; then
		output+="%{A1:herbstclient use_index $i:}$active  ${names[i]}$indicator$reset%{A}"
	else
		output+="%{A1:herbstclient use_index $i:}  ${names[i]}$indicator%{A}"
	fi;
done

echo "$output"
