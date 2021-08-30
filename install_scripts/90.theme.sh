font_dir="/usr/share/fonts/truetype"
font_size="12"

font_url="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"

wget "$font_url" --output-document=/tmp/JetBrainsMono.zip --show-progress --quiet;
sudo unzip /tmp/JetBrainsMono.zip -d "$font_dir/jetbrains-mono-nf"


gsettings set org.gnome.desktop.interface monospace-font-name "JetBrainsMono Nerd Font Mono $font_size"
echo "Font installed."

unset font_dir font_file font_url font_size
