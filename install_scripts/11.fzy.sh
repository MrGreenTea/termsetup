curl -s https://api.github.com/repos/junegunn/fzf/releases/latest\
 | grep "browser_download_url.*linux_amd64" \
 | cut -d : -f 2,3 \
 | tr -d '"' \
 | wget --output-document="/tmp/fzf.tar" --input-file - --no-verbose

sudo tar -xf /tmp/fzf.tar --directory=/usr/bin fzf
