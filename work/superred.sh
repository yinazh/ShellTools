#!/bin/sh

function superred_help(){
	echo -e "${FONT_BLUE_UNDERLINE}smb平台${FONT_RES}://10.65.8.123/smb/"
}

function sp11_compile_cmd(){
	echo -e "${FONT_RED_UNDERLINE}sp11项目${FONT_RES}"
	echo -e "----------------------------------------"
	echo -e "编译指令："
        echo -e "sudo docker start yinaizhong"
	echo -e "sudo docker exec -it yinaizhong /bin/bash"
	echo -e "export SUPERRED_CUSTOMER=wh"
	echo -e "bash sp11_natv.sh all"
	echo -e "bash sp11_natv.sh pac"
	echo -e "拷贝文件："
	echo -e "scp yinaizhong@10.65.8.115:/data2/yinaizhong/sp11/ums9620-a11/out/target/product/ums9620_sp11/cp_sign/QOGIRN6PRO_SUPER_SIGN_R/ums9620_sp11_native-userdebug-native_QOGIRN6PRO_SUPER_SIGN_R.pac /d/workspace/系统镜像/sp11/"
	echo -e "启动刷机模式："
	echo -e "adb reboot autodloader"

}
