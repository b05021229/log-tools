#!/bin/sh
#fireice
#copy log in midnigh

HOME="/home/fireice"

datenow=`date +%Y%m%d%H%M`

daynow=`date +%Y%m%d`

timepath=`date +%H%M`

minnow=`date +%M`

path=`pwd`

shellpath="$path/shell"

logpath="$HOME/log/debug"

autosavepath="$logpath/zzz/autosave" #自动保存到目录

daypath="$autosavepath/$daynow" #每天按照日期保存目录

filepath="$daypath/$timepath" #每次到日志按照生成时间目录保存

#function 定义
cdpath ()
{
if [ -d "$1" ];then
   echo "$1 path exist"
else
   echo "$1 path does not exist"
   cd $2
   mkdir -p $1
fi
}
echo "Time is $datenow now"
echo "Day is $daynow"
echo "Hour is $hournow"
echo "Min is $minnow"
echo "The path is $path"
echo "The shell path is $shellpath"

if [ -d "$shellpath" ];then
   echo "Shell path exist"
else
   mkdir "$shellpath"
fi 
#cd $shellpath
#autosave  目录是否存在
if [ -d "$autosavepath" ];then
   echo "$autosavepath path exist"
else
   echo "$autosavepath path does not exist"
   cd $logpath
   mkdir -p $autosavepath
fi
#创建当天目录
if [ -d "$daypath" ];then
      echo "$daypath path exist" 
   else
      echo "$daypath path does not exist"
      cd $autosavepath
      mkdir -p $daypath
fi
#自动保存目录是否存在
if [ -d "$filepath" ];then
      echo "$filepath path exist delete them" 
   else
      echo "$filepath path does not exist"
      cd $daypath
      mkdir -p $filepath
fi
#检测log是否存在
echo `pwd`
cd $logpath
echo `pwd`
if [  `ls|grep log|wc -l` -gt 0 ];then
      echo "log file exist"
      echo "logadm -on"#change to open log by cbp user
      cp $logpath/*.log $filepath 
   else
      echo "log file does not exist"
fi

if [  `ls|grep log|wc -l` -gt 0 ];then
      echo "log file exist"
      echo "logadm -on"#change to open log by cbp user
      cp $logpath/*.log $filepath 
   else
      echo "log file does not exist"
fi

