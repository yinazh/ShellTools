#!/bin/sh

export TOOLS_PATH="${CMDER_ROOT}/../ShellTools"
export WORK_PATH="${CMDER_ROOT}/../../workspace"

function superred_user_help(){
	#echo -e "${FONT_GREEN_UNDERLINE}github_personal_token${FONT_RES}: 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  (2024年3月1日到期)"
	#echo -e "${FONT_BLUE_UNDERLINE}大华开放平台${FONT_RES} 账户$ ： yinazh 密码： Yinazh@1234"
	echo -e "${FONT_BLUE_UNDERLINE}万里红个人信息${FONT_RES}"
	#echo -e "------------------------------"
	echo -e "账户   ： yinaizhong"
	echo -e "员工号 ： 202501936"
	echo -e "邮箱   ： yinaizhong@superred.com.cn"
}


function superred_help(){
	echo -e "${FONT_BLUE_UNDERLINE}smb平台${FONT_RES}://10.65.8.123/smb/"	
}

function superred_net(){
	echo -e "${FONT_BLUE_UNDERLINE}万里红工作网络${FONT_RES}："
	echo -e "		账号：StarrySea        密码：wlh20230625"
	echo -e "		账号：StarrySea_Guest  密码：welcomeu"
}

function sp11_compile_cmd(){
	echo -e "${FONT_RED_UNDERLINE}sp11项目${FONT_RES}"
	echo -e "----------------------------------------"
	echo -e "编译指令："
    echo -e "		sudo docker start yinaizhong"
	echo -e "		sudo docker exec -it yinaizhong /bin/bash"
	echo -e "		export SUPERRED_CUSTOMER=wh"
	echo -e "		bash sp11_natv.sh all"
	echo -e "		bash sp11_natv.sh pac"
	echo -e "拷贝文件："
	echo -e "		scp yinaizhong@10.65.8.115:/data2/yinaizhong/sp11/ums9620-a11/out/target/product/ums9620_sp11/cp_sign/QOGIRN6PRO_SUPER_SIGN_R/ums9620_sp11_native-userdebug-native_QOGIRN6PRO_SUPER_SIGN_R.pac /d/workspace/系统镜像/sp11/"
	echo -e "启动刷机模式："
	echo -e "		adb reboot autodloader"
}

function harmony_help(){
	echo -e "挂载目录："
	echo -e "		mount -o remount,rw /vendor/soc_platform"

}

alias serial36net='python ${TOOLS_PATH}/work/serial36.py'


alias openWorkflow='vi ${WORK_PATH}/workflow/工作日志_20250331~.md'
