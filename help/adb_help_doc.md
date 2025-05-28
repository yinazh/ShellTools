在 Android 开发中，如果需要查看 ADB 工作的详细日志（包括 USB 连接、设备授权、通信过程等），可以通过以下方法启用调试日志并进行分析。

1. 启用 ADB 详细调试日志
方法 1：设置 ADB_TRACE 环境变量（PC 端）
在运行 adb 命令时，通过设置 ADB_TRACE 环境变量来输出详细日志：

bash
# Windows (CMD/PowerShell)
set ADB_TRACE=all
adb devices

# Linux/macOS
export ADB_TRACE=all
adb devices
支持的日志级别：

all（全部日志）

adb（仅 ADB 通信）

sockets（Socket 连接）

transport（USB/网络传输）

usb（USB 设备通信）

示例输出：

adb: ... checking for 0x2bc4/0xc123 device (vid:pid)
adb: ... USB device detected: [Bus 001, Port 002]
adb: ... device authorized via RSA key
方法 2：启用 logcat 过滤 ADB 相关日志（设备端）
在设备上，ADB 的调试日志通常由 adbd（ADB 守护进程）生成，可以通过 logcat 查看：

bash
adb logcat -s adbd,UsbDeviceManager,UsbHostManager
关键日志标签：

adbd：ADB 守护进程的日志。

UsbDeviceManager：USB 设备模式切换日志。

UsbHostManager：USB 主机模式日志。

2. 检查 USB 连接状态
查看当前 USB 配置
bash
adb shell getprop sys.usb.config
adb shell getprop persist.sys.usb.config
如果输出不是 mtp,adb 或 adb，可能需要手动设置：

bash
adb shell svc usb setFunctions adb
adb reboot
查看 USB 设备信息
bash
adb shell lsusb  # 列出 USB 设备（需 root 或 busybox）
adb shell dumpsys usb  # 查看 USB 服务状态
3. 内核级 USB 调试（需 Root）
如果 ADB 无法连接，可以检查内核日志：

bash
adb shell su -c "dmesg | grep usb"
adb shell su -c "cat /proc/kmsg | grep usb"  # 实时日志
常见问题：

usb enumeration failed（USB 枚举失败，可能是硬件问题）

reset high-speed USB device（USB 重置，可能是线缆或接口问题）

4. 高级调试：strace 跟踪 adbd 进程
如果 adbd 崩溃或异常，可以使用 strace 跟踪系统调用（需 Root）：

bash
adb shell su -c "strace -p $(pidof adbd)"
关键信号：

EACCES（权限问题）

ENODEV（USB 设备未识别）

5. 常见问题及解决方案
问题	可能原因	解决方案
device unauthorized	RSA 密钥不匹配	删除 ~/.android/adbkey 并重新授权
no permissions	USB 设备权限问题	检查 udev 规则（Linux）或重装驱动（Windows）
failed to start daemon	adbd 未运行	adb kill-server && adb start-server
usb device not found	硬件/USB 线问题	更换 USB 线或接口
6. 总结
PC 端：使用 ADB_TRACE=all 查看详细通信日志。

设备端：logcat -s adbd,UsbDeviceManager 过滤相关日志。

内核级：dmesg | grep usb 检查硬件问题。

权限问题：确保 adbd 以 root 权限运行（adb root）。

如果问题仍然存在，可以尝试 更换 USB 线、电脑端口或刷机 进一步排查。