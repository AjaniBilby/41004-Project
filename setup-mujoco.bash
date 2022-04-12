sudo apt-get update
sudo apt-get install \
   curl \
   clang \
   git \
   ffmpeg \
   mesa-utils \
   libgl1-mesa-dev \
   libgl1-mesa-glx \
   libglew-dev \
   libosmesa6-dev \
   patchelf \
   python3-pip \
   python3-numpy \
   python3-scipy \
   net-tools \
   unzip \
   vim \
   wget \
   xpra \
   xvfb \
   xserver-xorg-dev

source ~/.profile

cd ~
curl https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh --output anaconda.sh
bash ./anaconda.sh
source .bashrc
conda create --name gym python=3.6
conda activate gym
rm -f ./anaconda.sh


curl https://roboti.us/download/mujoco200_linux.zip --output mujoco200_linux.zip
mkdir -p ~/.mujoco
unzip mujoco200_linux.zip -d ~/.mujoco
mv ~/.mujoco/mujoco200_linux/ ~/.mujoco/mujoco200
rm -f mujoco200_linux.zip
curl https://roboti.us/file/mjkey.txt --output ~/.mujoco/mjkey.txt
cp ~/.mujoco/mjkey.txt ~/.mujoco/mujoco200/bin/

export LD_LIBRARY_PATH=~/.mujoco/mujoco200/bin:$LD_LIBRARY_PATH
export MUJOCO_PY_MUJOCO_PATH=~/.mujoco/mujoco200/
export MUJOCO_PY_MJKEY_PATH=~/.mujoco/mjkey.txt



export DISPLAY="`grep nameserver /etc/resolv.conf | sed 's/nameserver //'`:0"
export DISPLAY="`sed -n 's/nameserver //p' /etc/resolv.conf`:0"
export DISPLAY=$(ip route|awk '/^default/{print $3}'):0.0
glxgears

pip install 'mujoco-py<2.1,>=2.0'
pip install gym
pip install pyglet
pip install gym[accept-rom-license]
pip install ale-py
pip install jupyter

code .