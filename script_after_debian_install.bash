sudo apt update
sudo apt upgrade -y

# Install firmware and tools
sudo apt install -y firmware-amd-graphics linux-headers-$(uname -r) dkms wget

# firmware update
sudo apt install fwupd
sudo fwupdmgr refresh
sudo fwupdmgr update

# https://rocm.docs.amd.com/projects/install-on-linux/en/latest/install/prerequisites.html
sudo apt install python3-setuptools python3-wheel

# https://rocm.docs.amd.com/projects/install-on-linux/en/latest/install/prerequisites.html#configuring-permissions-for-gpu-access
