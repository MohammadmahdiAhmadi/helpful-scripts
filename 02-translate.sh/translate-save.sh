#!/usr/bin/env bash
text="$(xsel -o)"
translate="$(wget -U "Mozilla/5.0" -qO - "http://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=fa&dt=t&q=$(echo $text | sed "s/[\"'<>]//g")" | sed "s/,,,0]],,.*//g" | awk -F'"' '{print $2, $6}' | perl -CSD -pe 's/[^\x{0600}-\x{06FF}\x{FB8A}-\x{FDFF}\x{FE70}-\x{FEFF}‌\x{200C}\x{200F}[:space:]]*$//')"
notify-send --expire-time=6000 --icon=info --app-name="Translate Saved" "$text" "$translate"
echo "$text:	$translate" >> "$HOME/SavedTranslate.txt"
