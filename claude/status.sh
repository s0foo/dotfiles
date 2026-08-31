#!/usr/bin/env bash
input=$(cat)

# Current working directory with ~ substitution
cwd=$(echo "$input" | jq -r '.cwd')
home="$HOME"
display_cwd="${cwd/#$home/\~}"
 
# Context window usage percentage
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Rate limit usage (5-hour session window and 7-day week window)
session_pct=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
session_reset=$(echo "$input" | jq -r '.rate_limits.five_hour.resets_at // empty')
week_pct=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
week_reset=$(echo "$input" | jq -r '.rate_limits.seven_day.resets_at // empty')

# Build status line
parts="$display_cwd"

if [ -n "$used_pct" ]; then
  parts="$parts | ctx: $(printf '%.0f' "$used_pct")%"
fi

if [ -n "$session_pct" ]; then
  parts="$parts | session: $(printf '%.0f' "$session_pct")%"
  if [ -n "$session_reset" ]; then
    reset_str=$(date -d "@$session_reset" '+%H:%M' 2>/dev/null)
    if [ -n "$reset_str" ]; then
      parts="$parts (resets $reset_str)"
    fi
  fi
fi

if [ -n "$week_pct" ]; then
  parts="$parts | week: $(printf '%.0f' "$week_pct")%"
  if [ -n "$week_reset" ]; then
    week_reset_str=$(date -d "@$week_reset" '+%a %d/%m %H:%M' 2>/dev/null)
    if [ -n "$week_reset_str" ]; then
      parts="$parts (resets $week_reset_str)"
    fi
  fi
fi

printf "%s" "$parts"
