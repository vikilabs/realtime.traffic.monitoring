#Remove Previous installation of CUDA and NVIDIA using ubuntu package manager

#echo "Download NVIDIA DRIVER, I have alredy downloaded suitable version and kept in ./drivers folder"
#https://www.nvidia.com/object/linux-amd64-display-archive.html
#chmod 777 ./drivers/NVIDIA-Linux-x86_64-375.82.run 
#sudo ./drivers/NVIDIA-Linux-x86_64-375.82.run --no-x-check 
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get install nvidia-375 

#Download CUDA 8 from the following link
#https://developer.nvidia.com/cuda-80-ga2-download-archive
sudo dpkg -i cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64.deb 
sudo apt-get install aptitude
sudo apt-get update
sudo apt-get install libcuda1-375
sudo apt-get install nvidia-375-dev
sudo apt-get install nvidia-375-dev
sudo apt-get install nvidia-cuda-toolkit
sudo apt-get update
sudo apt-get install cuda

#Add the following to BASHRC
echo "export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda8.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}" >> ~/.bashrc


#Blacklist Nouveau Driver
echo "blacklist nouveau" >> ~/blacklist-nouveau.conf 
echo "options nouveau modeset=0" >> ~/blacklist-nouveau.conf 
sudo cp ~/blacklist-nouveau.conf  /etc/modprobe.d/blacklist-nouveau.conf 
echo "reboot [y/n]"
read inp
if [ $inp == "y" ]; then
    echo "rebooting system"
    sudo reboot
fi
