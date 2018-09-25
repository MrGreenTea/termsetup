theme_url="https://wefunkster.deviantart.com/art/OSe-Light-Xtrlght-GTK-themes-for-elementary-OS-694065854"
icons_url="https://wefunkster.deviantart.com/art/MY-Remix-04-icon-theme-for-elementary-OS-695528378"

font_url="https://github.com/powerline/fonts/raw/master/SourceCodePro/Source%20Code%20Pro%20for%20Powerline.otf"
font_file="/usr/share/fonts/type1/source-code-pro-powerline/source-code-pro-powerline.otf"

echo "Download the zip files from the urls that open and then enter the path where the zip file is saved"

xdg-open "$theme_url" 1>%2 2>/dev/null
echo -n "Enter theme path: "
read theme_file
sudo unzip "$theme_file" -d /usr/share/themes/

xdg-open "$icons_url" 1>%2 2>/dev/null
echo -n "Enter icons path: "
read icons_file
sudo unzip "$icons_file" -d /usr/share/icons/


sudo mkdir "$(dirname "$font_file")"
sudo wget "$font_url" --output-document="$font_file"

echo "Themes and font installed. After a restart they can be set in tweaks"
unset theme_file icons_file font_file theme_url icons_url font_url
