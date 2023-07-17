sudo wget https://yum.enpass.io/enpass-yum.repo --output-document=/etc/yum.repos.d/enpass-yum.repo
sudo rpm-ostree install --apply-live enpass
