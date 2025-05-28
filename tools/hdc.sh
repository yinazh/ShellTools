#!/bin/sh

## for hdc tools

export SHELL_DIR="${CMDER_ROOT}/../ShellTools"

### 操作指令

#进入设备后台
alias hShl='hdc shell'

#重启设备
alias hReboot='hdc target boot'

#挂载设备
alias hMont='hdc target mount'
alias hRemot='hdc shell "mount -o remount,rw /"'

# 抓取日志
alias hlog='hdc shell hilog'
alias hloge='hdc shell hilog -g "Error"'
alias hlogd='hdc shell hilog -g "Debug"'
alias hlogi='hdc shell hilog -g "Info"'
alias hlogw='hdc shell hilog -g "Warning"'
alias hlogT='hdc shell hilog -T '
alias hlogc='hdc shell hilog -c'
alias hlogStore='hdc file rece data/log/hilog/ .'


#进入autodloader模式，刷机
alias hAdloader='hdc shell reboot autodloader'

#查看HDC版本
alias hVersion='hdc -v'
#alias hKill='hdc kill'
#alias hStart='hdc start -r'


#列出连接的设备
alias hDev='hdc list targets'
#列出连接的设备,显示详细信息
alias hDevV='hdc list targets -v'

#设备UDID
alias hUdid='hdc shell bm get --udid'

#设备信息
alias hrProp='hdc shell param get'

#设备名称
alias hDevice='hdc shell param get const.product.name'
#Brand
alias hBrand='hdc shell param get const.product.brand'
#model
alias hModel='hdc shell param get const.product.model'
#系统版本
alias hVersion='hdc shell param get const.product.software.version'
#OS版本
alias hOSVersin='hdc shell param get const.ohos.apiversion'
#cpu架构
alias hCpu='hdc shell param get const.product.cpu.abilist'

#分辨率
alias hScreenResolution='hdc shell hidumper -s RenderService -a screen'

#Ip
alias hIp='hdc shell ifconfig'

#电量/温度
alias hBattery='hdc shell hidumper -s BatteryService -a -i'

#屏幕信息
alias hScreenInfo='hdc shell hidumper -s DisplayManagerService -a -a'

#屏幕旋转状态
alias hScreenRotation='hdc shell hidumper -s DisplayManagerService -a -a'

#屏幕点亮状态
alias hScreenLightStatus='hdc shell hidumper -s PowerManagerService -a -s'

#唤醒屏幕
alias hWakeUp='hdc shell power-shell wakeup'

#联网状态
alias hNet='hdc shell hidumper -s NetConnManager'

#wifi信息
alias hWifi='hdc shell hidumper -s WifiDevice'

#安装应用
alias hInstall='hdc install'

#卸载应用
alias hUninstall='hdc uninstall'

#获取应用列表
alias hGetAppList='hdc shell bm dump -a'

#启动应用
alias hStart='hdc shell aa start -a'

#退出应用
alias hStop='hdc shell aa force-stop'

#获取应用详细信息
alias hAppInfo='hdc shell bm dump -n'

#清除应用数据
alias hClsAppData='hdc shell bm clean -h'

#显示端口转发列表
alias hPort='hdc fport ls'

#文件传输
alias hSend='hdc file send'

#文件接收
alias hRecv='hdc file recv'

#模拟操作
##点击
alias hClick='hdc shell uitest uiInput click'
##双击
alias hDoubleClick='hdc shell uitest uiInput doubleClick'
##长按
alias hLongClick='hdc shell uitest uiInput longClick'
##快滑
alias hFling='hdc shell uitest uiInput fling 10 10 200 200 500'
##慢滑
alias hSwipe='hdc shell uitest uiInput swipe 10 10 200 200 500'
##拖拽
alias hDrag='hdc shell uitest uiInput drag 10 10 100 100 500'
##左滑
alias hDircFlingLeft='hdc shell uitest uiInput dircFling 0 500'
##右滑
alias hDircFlingRight='hdc shell uitest uiInput dircFling 1 600'
##上滑
alias hDircFlingUp='hdc shell uitest uiInput dircFling 2'
##下滑
alias hDircFlingDown='hdc shell uitest uiInput dircFling 3'
##输入框输入
alias hInput='hdc shell uitest uiInput inputText'
##返回主页
alias hHome='hdc shell uitest uiInput keyEvent Home'
##返回上一步
alias hBack='hdc shell uitest uiInput keyEvent Back'

##组合键粘贴操作
##hdc shell uitest uiInput keyEvent 2072 2038

#屏幕截图
alias hScreenCap='hdc shell uitest screenCap'
#屏幕截图指定路径
alias hScreenCapTo='hdc shell uitest screenCap -t'

# hdc连接IP
alias hconip='hdc tconn '
