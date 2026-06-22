#!/usr/bin/env bash
input=$(cat)
 
# Current working directory with ~ substitution
cwd=$(echo "$input" | jq -r '.cwd')
home="$HOME"
display_cwd="${cwd/#$home/\~}"
 
# Context window usage percentage
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
 
# Session cost from the JSON cost field
cost=$(echo "$input" | jq -r '.cost.total_cost_usd // empty')
 
# Build status line
parts="$display_cwd"
 
if [ -n "$used_pct" ]; then
  parts="$parts | ctx: $(printf '%.0f' "$used_pct")%"
fi
 
if [ -n "$cost" ]; then
  parts="$parts | \$$(printf '%.4f' "$cost")"
fi
 
printf "%s" "$parts"
