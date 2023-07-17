font_dir="$HOME/.local/fonts"
font_size="12"

font_url="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"

wget "$font_url" --output-document=/tmp/JetBrainsMono.zip --show-progress --quiet;
unzip /tmp/JetBrainsMono.zip -d "$font_dir/jetbrains-mono-nf"


gsettings set org.gnome.desktop.interface monospace-font-name "JetBrainsMono Nerd Font $font_size"
echo "Font installed."

unset font_dir font_file font_url font_size
