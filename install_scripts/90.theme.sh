font_dir="/usr/share/fonts/truetype"
font_size="12"

font_urls="
  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
"


for font_url in ${font_urls}; do
  sudo wget "$font_url" --directory-prefix="$font_dir/meslo-lgs-nf/" --show-progress --quiet;
done

gsettings set org.gnome.desktop.interface monospace-font-name "MesloLGS NF $font_size"
echo "Font installed."

unset font_dir font_file font_url font_size font_urls
