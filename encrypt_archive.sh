#!/usr/bin/env bash
#
# encrypt_archive.sh - tar up files/folders and encrypt the archive with AES-256 via gpg.
# Output file name is auto-generated and timestamped: archive_YYYYmmdd_HHMMSS.tar.gz.gpg
#
# Usage:
#   ./encrypt_archive.sh path1 [path2 ...]
#
set -euo pipefail

usage() {
    echo "Usage: $0 <path> [path ...]" >&2
    exit 1
}

if [[ $# -eq 0 ]]; then
    usage
fi

output="archive_$(date +%Y%m%d_%H%M%S).tar.gz.gpg"

for path in "$@"; do
    if [[ ! -e "$path" ]]; then
        echo "Error: '$path' does not exist." >&2
        exit 1
    fi
done

if [[ -e "$output" ]]; then
    echo "Error: output file '$output' already exists, refusing to overwrite." >&2
    exit 1
fi

if ! command -v gpg >/dev/null 2>&1; then
    echo "Error: gpg is not installed." >&2
    exit 1
fi

tmp_output="$(mktemp "${output}.XXXXXX")"
trap 'rm -f "$tmp_output"' EXIT

tar -czf - -- "$@" | gpg --symmetric --cipher-algo AES256 --output "$tmp_output"

mv "$tmp_output" "$output"
trap - EXIT

echo "Encrypted archive written to '$output'."
