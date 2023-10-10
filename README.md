# ServerHappyShell
能让服务器爽起来的剑皇脚本。

# 使用方法
需要安装wget。

apt install wget -y

需要安装killall，也就是psmisc。

apt install psmisc -y

下载脚本后在修改目录下list.txt，在里面写上目标链接。可以多行多个链接。

脚本前面的：
threadscount=20 #启动wget的线程数
waitingtime=10 #等待wget结束的最长时间(秒)
可以自行按需修改。

bash ServerHappyShell.sh

# 一定要创建list.txt。脚本没有任何错误捕捉和处理。
