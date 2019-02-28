# Linux查询正在运行的python程序
ps -ef | grep python

# 这样就可以查看到了当前python正在运行的程序
# 同理要查看其它的进程也是一样的 ps -ef |grep 进程名
# 结束进程的话直接 kill -9 进程id就可以了
