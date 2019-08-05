font_url="https://github.com/powerline/fonts/raw/master/SourceCodePro/Source%20Code%20Pro%20for%20Powerline.otf"
font_file="/usr/share/fonts/type1/source-code-pro-powerline/source-code-pro-powerline.otf"

sudo mkdir "$(dirname "$font_file")"
sudo wget "$font_url" --output-document="$font_file"

echo "Font installed. Can be set in tweaks."

unset font_file font_url
