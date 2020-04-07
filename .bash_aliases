# Vman plugin actually allows you to view man pages in Vim
vman() {
  vim -c "SuperMan $*"

  if [ "$?" != "0" ]; then
      echo "No manual entry for $*"
    fi
}

# Solve the problem: Ack.vim error: perl: warning: Setting locale failed
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# used to record bash directory history
source ~/.vim_mengqi/acd_func.sh

# use ctrl+r and ctrl+s to search history cmd
[[ $- == *i* ]] && stty -ixon

# to run zadas
export LD_LIBRARY_PATH="/home/mengqi/work/gerrit/zadas/out/linux_x86_64/bin:$LD_LIBRARY_PATH"

# update ros environment

# If you want to use conda environment, comment out the following two lines.
# Python env in ROS may conflict with Conda, DONOT enable both of them.
source /opt/ros/kinetic/setup.bash
source /home/mengqi/catkin_ws/devel/setup.bash
alias ros_ws_update='source devel/setup.bash'
# Use conda environment
# conda activate base

# export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:/home/mengqi/work/positioning/zm_slam/zm_version/Examples/ROS/ORB_SLAM2
export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:/home/mengqi/work/positioning/Lidar_FeatureMap/Examples/ROS

# terminal vpn
#sudo /etc/init.d/polipo restart

export http_proxy="http://127.0.0.1:12333"
export https_proxy="http://127.0.0.1:12333"

alias tdassh='ssh root@192.168.1.100'
alias tdacopybin='scp -rC out/A_FAW_C229_fc/linux_tda2x/bin root@192.168.1.100:/zadas/'
alias tdacopylib='scp -rC out/A_FAW_C229_fc/linux_tda2x/lib root@192.168.1.100:/zadas/'
alias tdacopyall='scp -rC out/A_FAW_C229_fc/linux_tda2x/*   root@192.168.1.100:/zadas/'

alias rmnet='sudo rm /etc/resolv.conf'

alias catkin_make='catkin_make -j1'
alias make='make -j1'

alias buildmake='rm -rf build && mkdir build && cd build && cmake .. && make'

# QT path
export PATH=/home/mengqi/Qt5.7.1/5.7/gcc_64/bin:$PATH
# compile tda2x
export PATH=/media/mengqi/Windows/Ubuntu_Files/opt/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf/bin:$PATH
# compile agl
export PATH=/media/mengqi/Windows/Ubuntu_Files/opt/poky-agl/3.0.0+snapshot/sysroots/x86_64-aglsdk-linux/usr/bin/aarch64-agl-linux:$PATH

