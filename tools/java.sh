#!/bin/sh

## apk分析工具
## github地址：https://github.com/google/android-classyshark



function sharkApk(){
	if [ "$1" ];then
       java -jar /d/workspace/code/ShellTools/source/ClassyShark.jar -open $1
    else
       echo "apk is null"
    fi
}
