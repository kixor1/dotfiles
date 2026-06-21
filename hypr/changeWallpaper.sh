wallpapersDir="~/.config/dotfiles/hypr/images/wallpapers"

currentWallpaper="~/.config/dotfiles/hypr/images/current/wallpaper.jpg"

options="$(ls -1 $wallpapersDir)"

echo "Choose a wallpaper"

select wallpaper in options; do
	kitten icat $wallpaper
	read -p "Would you like to select this wallpaper? (y/n)" choice
	echo $choice
	if [[ $choice == "y" ]] || [[ $choice == "Y" ]]; then
		# rm -f $currentWallpaper
		# cp -f $wallpaper $currentWallpaper
		echo $wallpaper
		echo $currentWallpaper
		kitten icat $currentWallpaper
		echo "Wallpaper was successfully changed! Exiting..."
		break;
	else
		echo "Wallpaper was not changed. Exiting..."
		break;
	fi
done
