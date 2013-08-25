#!/bin/sh

HOME="/home/fireice"

datenow=`date +%Y%m%d%H%M`

daynow=`date +%Y%m%d`

daytomorrow=`date -d next-day +%Y%m%d`

timepath=`date +%H%d`

minnow=`date +%M`

path=`pwd`

shellpath="$path/shell"

logpath="$HOME/log/debug"

autosavepath="$logpath/zzz/autosave" #自动保存到目录

daypath="$autosavepath/$daynow" #每天按照日期保存目录

daytomorrowpath="$autosavepath/$daytomorrow" #后一天按照日期保存目录

filepath="$daypath/$timepath" #每次到日志按照生成时间目录保存

#function 定义
#备份当天目录 
cd $autosavepath
if [ -d "$daypath" ]&&[ ! -d $daynow.tar.gz ];then
      echo "$daynow path exist backup them" 
      tar -cvf $daynow.tar $daynow 
      gzip $daynow.tar 
      rm -rf $daynow.tar
      rm -rf $daynow
else 
      echo "$daynow has been backup"
fi


#0点前检测log是否存在点
cd $logpath
if [  `ls|grep log|wc -l` -gt 0 ];then
      echo "log file exist"
      rm $logpath/*.log 
      echo "logadm -on" #change to open log
   else
      echo "log file does not exist"
fi

#0点前清除明天的文件夹
cd $autosavepath
if [  -d $daytomorrowpath ];then
      echo "$daytomorrow file exist"
      rm -rf $daytomorrowpath 
      
   else
      echo "$daytomorrow file does not exist"
fi


