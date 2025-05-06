# FOR HYPRLAND

exec-programm () {
    hyprctl --instance 0 "dispatch exec $1"

}

switch-workspace ()
{
    hyprctl dispatch workspace $1
}
