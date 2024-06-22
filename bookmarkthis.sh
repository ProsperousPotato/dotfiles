#!/bin/sh

bookmark="$(xclip -o)"
bookmarkfile="$HOME/.local/share/bookmarks/bookmarksfile"

if grep -q "^$bookmark$" "$bookmarkfile"; then
	exit
else
	echo "$bookmark" >> "$bookmarkfile"
fi
