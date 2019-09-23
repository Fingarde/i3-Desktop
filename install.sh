cd /home/fingarde

cp /etc/apt/sources.list /etc/apt/old_sources.list
sed 's/main/main contrib non-free/g' /etc/apt/old_sources.list > /etc/apt/sources.list

apt update && apt upgrade -y

apt install -y wget xorg sudo playerctl dunst compton i3 psmisc ksnapshot rxvt-unicode rofi xbacklight feh udiskie lightdm firefox-esr feh alsa-utils pavucontrol gstreamer1.0-pulseaudio git build-essential cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xrm-dev

sudo adduser fingarde sudo
sudo adduser fingarde audio

X -configure
cp /root/xorg.conf.new /etc/X11/xorg.conf

wget https://github.com/jaagr/polybar/releases/download/3.4.0/polybar-3.4.0.tar
tar xvf polybar-3.4.0.tar polybar/

cd polybar
mkdir build
cd build
cmake ../
make -j$(nproc)
sudo make install -B

cd ../../

cp -rf bin /home/fingarde
cp -rf .config /home/fingarde
cp -f .Xresources /home/fingarde
cp -rf .wall /home/fingarde

git clone https://github.com/ZulwiyozaPutra/SF-Mono-Font
cd SF-Mono-Font

mkdir -p /home/fingarde/.local/share/fonts/Apple/OpenType/'SF Mono'
cp *.otf /home/fingarde/.local/share/fonts/Apple/OpenType/'SF Mono'

chown -R fingarde:fingarde /home/fingarde/*
chown -R fingarde:fingarde /home/fingarde/.*

