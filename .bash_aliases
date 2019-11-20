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

# to run zadas
export LD_LIBRARY_PATH="/home/mengqi/work/gerrit/zadas/out/linux_x86_64/bin:$LD_LIBRARY_PATH"

# update ros environment
source /opt/ros/kinetic/setup.bash
alias ros_ws_update='source devel/setup.bash'

# solve rviz libGl drawable error
# Copy, PBuffer, or FBO
# export OGRE_RTT_MODE=PBuffer

# terminal vpn
#sudo /etc/init.d/polipo restart
export http_proxy="http://127.0.0.1:12333"
export https_proxy="http://127.0.0.1:12333"


alias zadasssh='ssh root@192.168.244.101'
alias zadascopybin='scp -rC out/linux_imx6/bin/ root@192.168.244.101:/zadas/'
alias zadascopydata='scp -rC out/linux_imx6/data/ root@192.168.244.101:/zadas/'
alias zadascopyparams='scp -rC out/linux_imx6/params/ root@192.168.244.101:/zadas/'
alias zadascopyall='scp -rC out/linux_imx6/bin/ out/linux_imx6/data/ out/linux_imx6/params/ root@192.168.244.101:/zadas/'

alias catkin_make='catkin_make -j1'
alias make='make -j1'

export PATH=/home/mengqi/Qt5.7.1/5.7/gcc_64/bin:$PATH

source /home/mengqi/catkin_ws/devel/setup.bash

export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:/home/mengqi/work/positioning/catkin_loop
export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:/home/mengqi/work/positioning/imu_dr_gps
# export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:/home/mengqi/work/positioning/zm_slam/zm_version/Examples/ROS/ORB_SLAM2
export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:/home/mengqi/work/positioning/Lidar_FeatureMap/Examples/ROS


