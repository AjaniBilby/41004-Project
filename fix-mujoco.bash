export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/.mujoco/mujoco200/bin
export MUJOCO_PY_MUJOCO_PATH=~/.mujoco/mujoco200/
export MUJOCO_PY_MJKEY_PATH=~/.mujoco/mjkey.txt

export DISPLAY="`grep nameserver /etc/resolv.conf | sed 's/nameserver //'`:0"
export DISPLAY="`sed -n 's/nameserver //p' /etc/resolv.conf`:0"
export DISPLAY=$(ip route|awk '/^default/{print $3}'):0.0