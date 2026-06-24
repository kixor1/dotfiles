wallpapersDir=~/.config/dotfiles/hypr/images/wallpapers
currentDir=~/.config/dotfiles/hypr/images/current
currentWallpaper="${currentDir}/wallpaper"
options="$(ls -1 $wallpapersDir)"
changed=0

# bind escape (to be completed)

echo -e "\e[?1049h"
while true; do
	clear
	echo "Choose a wallpaper:"
	wallpaper=$(echo -e "$options" | fzf --reverse --cycle --prompt "Choose a wallpaper:")
	echo -e "\e[?1049h"
	[[ ! $options =~ $wallpaper ]] && exit 1
	clear

	# display selected image, then ask for confirmation
	echo "loading preview..."
	kitten icat "${wallpapersDir}/${wallpaper}"
	echo "Would you like to select this wallpaper? (y/n/q)"
	read -p "" choice	
	if [[ $choice == "y" ]] || [[ $choice == "Y" ]]; then
		rm -f $currentWallpaper
		cp -f "${wallpapersDir}/${wallpaper}" "${currentDir}/wallpaper"
		changed=1
		break;
	elif [[ $choice == "q" ]] || [[ $choice == "Q" ]]; then
		break;
	fi
done

echo -e "\e[?1049l"

if [ $changed == 0 ]; then
	echo "Wallpaper was not changed."
else
	echo $currentWallpaper

        killall hyprpaper
        hyprpaper & nohup command >/dev/null 2>&1	
	echo "Wallpaper was changed!"
fi
