# adb查看安装的应用
adb shell pm list packages [-f] [-d] [-e] [-s] [-3] [-i] [-u] [--user USER_ID] [FILTER]
即在 adb shell pm list packages 的基础上可以加一些参数进行过滤查看不同的列表，支持的过滤参数如下：

参数	显示列表
无	所有应用
-f	显示应用关联的 apk 文件
-d	只显示 disabled 的应用
-e	只显示 enabled 的应用
-s	只显示系统应用
-3	只显示第三方应用
-i	显示应用的 installer
-u	包含已卸载应用
<FILTER>	包名包含 <FILTER> 字符串

#安装应用
adb install 后面可以跟一些可选参数来控制安装 APK 的行为，可用参数及含义如下：

参数	含义
-l	将应用安装到保护目录 /mnt/asec
-r	允许覆盖安装
-t	允许安装 AndroidManifest.xml 里 application 指定 android:testOnly="true" 的应用
-s	将应用安装到 sdcard
-d	允许降级覆盖安装
-g	授予所有运行时权限

#卸载应用
adb uninstall [-k] <packagename>
<packagename> 表示应用的包名，-k 参数可选，表示卸载应用但保留数据和缓存目录。

#查看前提activity
adb shell dumpsys activity activities | grep mFocusedActivity

#查看正在运行的services
db shell dumpsys activity services [<packagename>]
<packagename> 参数不是必须的，指定 <packagename> 表示查看与某个包名相关的 Services，不指定表示查看所有 Services。

<packagename> 不一定要给出完整的包名，比如运行 adb shell dumpsys activity services org.mazhuang，那么包名 org.mazhuang.demo1、org.mazhuang.demo2 和 org.mazhuang123 等相关的 Services 都会列出来。

#查看日志
adb logcat "*:W"  //查看Ｗarning及以上的日志
adb logcat ActivityManager:I MyApp:D *:S　 //日志拼接，可以查看多个tag的log  

# 日志格式
adb logcat -v <format>　　//指定日志输出格式
默认格式：　<priority>/<tag>(<pid>): <message>
progress: <priority>(<pid>) <message>
tag：　<priority>/<tag>: <message>
raw：　<message>
time: <datetime> <priority>/<tag>(<pid>): <message>
threadtime: <datetime> <pid> <tid> <priority> <tag>: <message>
long:  [ <datetime> <pid>:<tid> <priority>/<tag> ]
<message>

#清空日志
adb logcat -c

＃内核日志
adb shell dmesg

＃查看屏幕信息
adb shell wm size
adb shell wm density
adb shell dumpsys window displays

＃设置显示区域
adb shell wm overscan 0,0,0,200
四个数字分别表示距离左、上、右、下边缘的留白像素，以上命令表示将屏幕底部 200px 留白。
恢复原显示区域命令：
adb shell wm overscan reset

＃截图保留到电脑
adb exec-out screencap -p > sc.png
#录制屏幕
adb shell screenrecord /sdcard/filename.mp4
