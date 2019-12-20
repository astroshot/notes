# Install i3

## Packages

```bash
sudo pacman -S i3-gaps xorg-servier xorg-init xorg-xrandr
```

## Fonts

```bash
sudo pacman -S wqy-microhei
```

```bash
yay -S nerd-fonts-meslo polybar
```

## Adjust resolution

Input `cvt 1920 1080` and returns

```bash
Modeline "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
```

Then

```bash
xrandr --newmode "1920x1080" 173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
xrandr --addmode Virtual-1 1920x1080
xrandr --output Virtual-1 --mode 1920x1080
```

