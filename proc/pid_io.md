查看进程磁盘IO负载

文件：/proc/$pid/io

https://www.cnblogs.com/createyuan/p/3728340.html

如果内核版本大于2.6.20，通过cat /proc/$pid/io 便可以获取进程的io信息。

```
rchar: 242613900466     // 读出的总字节数，read()或者pread()中的长度参数总和(pagecache中统计而来，不代表实际磁盘的读入)
wchar: 8672831817       // 写入的总字节数，write()或者pwrite()中的长度参数总和
syscr: 109111792        // 读取磁盘的调用次数，read()或者pread()总的调用次数
syscw: 14135667         // 写入磁盘的调用次数，write()或者pwrite()总的调用次数
read_bytes: 2475479552  // 实际从磁盘中读取的字节总数
write_bytes: 6475268096 // 实际写入到磁盘中的字节总数
cancelled_write_bytes: 262979584    // 由于截断pagecache导致应该发生而没有发生的写入字节数
```

