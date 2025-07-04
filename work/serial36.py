import serial
import time

# 配置串口参数
port = 'COM36'         # 串口号（Windows）
baudrate = 115200        # 波特率（根据设备调整）
bytesize = serial.EIGHTBITS  # 数据位
parity = serial.PARITY_NONE  # 校验位
stopbits = serial.STOPBITS_ONE  # 停止位
timeout = 1            # 读超时（秒）

try:
    # 创建串口连接
    ser = serial.Serial(
        port=port,
        baudrate=baudrate,
        bytesize=bytesize,
        parity=parity,
        stopbits=stopbits,
        timeout=timeout
    )
    print(f"成功连接串口 {ser.name}")

    # 要发送的指令（根据设备要求替换）
    command = b'service_control stop hdcd;param set persist.hdc.mode tcp;param set persist.hdc.mode.usb disable;param set persist.hdc.mode.tcp enable;param set persist.hdc.port 6666;param set persist.hdc.root 1;service_control start hdcd;netstat -aptn\r\n'  # 示例指令（注意使用字节串）

    # 发送指令
    ser.write(command)
    print(f"已发送指令: {command.decode('ascii').strip()}")

    # 等待设备响应（根据实际需要调整）
    time.sleep(2)  # 短延时确保数据接收完成

    # 读取响应
    response = ser.read_all()  # 读取所有缓冲数据
    if response:
        print("收到响应:")
        print(response.decode('ascii'))  # 尝试ASCII解码
    else:
        print("未收到响应")

except serial.SerialException as e:
    print(f"串口错误: {e}")
except Exception as e:
    print(f"发生错误: {e}")
finally:
    # 确保关闭串口
    if 'ser' in locals() and ser.is_open:
        ser.close()
        print("串口已关闭")