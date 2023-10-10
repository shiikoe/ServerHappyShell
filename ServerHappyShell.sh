#!/bin/bash
threadscount=20 #启动wget的线程数
waitingtime=10 #等待wget结束的最长时间(秒)
while true
num=1 #初始化检测的循环
do
for i in $( seq 1 $threadscount)
do 
    wget -b -i list.txt --output-document=/dev/null >nul
done

echo -e "\e[42m 已启动$threadscount 个wget进程。现在开始检测并等待最后一个wget下载完成。 \e[0m"

while [ $num -le $waitingtime ]
do
num=$(( $num + 1 ))
ps -fe|grep wget |grep -v grep >nul
if [ $? -ne 0 ]
then
echo "wget已经全部退出。开始下一轮操作。"
num=$(($waitingtime+1))
else
echo "第$num 次检测wget状态。"
echo -e  "\e[41m wget仍在运行。 \e[0m等待1秒钟后重新检测(最长等待10秒)。"
sleep 1
fi

done

echo -e "\e[42m wget已全部结束或已达最长等待时间。即将开始下一轮操作。 \e[0m"
killall wget >nul 2>nul
sleep 1
clear
done