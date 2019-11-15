font_dir="/usr/share/fonts/type1"
font_file="$font_dir/sf-mono.zip"
font_url="https://github.com/Twixes/SF-Mono-Powerline/archive/master.zip"

sudo wget "$font_url" --output-document="$font_file"
sudo unzip "$font_file" -d "$font_dir"

gsettings set org.gnome.desktop.interface monospace-font-name 'SF Mono Powerline 12'
echo "Font installed."

unset font_file font_url
