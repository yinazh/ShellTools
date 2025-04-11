1、hdc是否安装成功
```shell
$ hdc_std shell （能识别即成功）
```
2、关机
```shell
$ hdc_std shell reboot shutdown
```
3、、重新启动系统
```shell
$ hdc_std shell reboot
```
4、安装应用：
```shell
$ hdc_std install 应用包所在路径
$ hdc_std install D:\liukch\downloads\hengping\browser.hap
```
5、卸载应用
```shell
$ hdc_std uninstall [BundleName]
$ hdc_std uninstall com.archermind.web
```
6、查BundleName和AbilityName名称
```shell
$ hdc_std shell wukong appinfo
```
7、上传文件到pad
```shell
$ hdc_std file send 文件路径(文件位置) 文件上传pad的路径
$ hdc_std file send D:\wy\downloads\img\8.jpg /storage/media/100/local/files/Pictures
```
8、从pad下载文件到电脑
```shell
$ hdc_std file recv 文件路径(文件位置) 文件下载到电脑的路径
$ hdc_std file recv storage/media/100/local/files/Pictures/Screenshots D:\
```
9、查看日志
```shell
$ hdc_std hilog
```
10、抓取log并保存
```shell
$ hdc_std hilog >log.log

$ hdc_std hilog > D:\log.txt
```
11、查询连接设备
```shell
$ hdc_std list targets
```
12、获取设备udid
```shell
$ hdc_std shell bm get -u
```
13、查看应用配置信息
```shell
$ hdc_std shell bm dump -n [BundleName]

$ hdc_std shell bm dump -n com.archermind.web
```
14、清除应用缓存
```shell
$ hdc_std shell bm clean -n [BundleName] -c
$hdc_std shell bm clean -n com.archermind.web -c
```
15、清除应用数据
```shell
$ hdc_std shell bm clean -n [BundleName] -d
$ hdc_std shell bm clean -n com.archermind.web -d
```
16、启动指定应用
```shell
$ hdc shell aa start -a EntryAbility -b 包名
$ hdc_std shell aa start -a EntryAbility -b com.archermind.web
```
17、强制退出应用
```shell
$ hdc_std shell aa force-stop [BundleName]

$ hdc_std shell aa force-stop com.superred.reminder
```
18、查看当前任务栈的ability信息(后台启动的应用)
```shell
$ hdc_std shell aa dump -l
```
19、截图
```shell
$ hdc_std shell snapshot_display -f /data/screenshot.png
$ hdc_std shell file recv /data/screenshot.png D:
```
20、获取进程信息和线程信息
```shell
$ hdc shell top
```
21、查看屏幕信息
```shell
$ hdc shell hidumper -s 10 -a screen
```
22、查看当前窗口信息
```shell
$ hdc shell hidumper -s WindowManagerService -a '-a'
```
23、获取应用信息
```shell
$ hdc shell aa dump -a
```
