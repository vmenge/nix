files=("$HOME"/.wallpaper/*)
if [ ${#files[@]} -eq 0 ]; then
echo "No files found in $HOME/.wallpaper"
exit 1
fi
random_file="${files[RANDOM % ${#files[@]}]}"
echo GOT
echo $random_file
swww img $random_file
