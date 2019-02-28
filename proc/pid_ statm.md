在/proc/pid/statm中看到的

[root@109-com1 6939]# cat statm
723692 9315 1479 80 0 692850 0

每列含义解释：
2826m*1024/4=723692　　top中的PID为6939的VIRT字段2826m
Size (pages)= 723692  任务虚拟地址空间的大小 VmSize/4
36m*1024/4=9315　　　　top中的PID为6939的RES字段36m
Resident(pages)= 9315  应用程序正在使用的物理内存的大小 VmRSS/4
5916/4=1479　　　　　　top中的PID为6939的SHR字段5916
Shared(pages)= 1479  共享页数