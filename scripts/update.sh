DISTRO="$(hostnamectl | grep "Operating System" | awk '{print $3 $4}')"

if [[ "$DISTRO" != "ArchLinux" ]]; then
    echo "Not available for distros other than arch"
    exit 1
fi

echo "On Arch Linux; executing update routine"

echo
echo "Updateing with FLATPAK"
flatpak update --assumeyes
echo
echo "Updateing with PACMAN"
sudo pacman -Syyyu
echo
echo "Updateing with PARU"
paru -Syyyu
echo
echo "Updateing with FWUPDMGR"
# fwupdmgr get-devices
fwupdmgr refresh
fwupdmgr update

echo
echo "Update routine complete :)"
