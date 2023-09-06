import xml.dom.minidom

import os

from subprocess import call

 

# 1. 修改为源码要保存的路径

rootdir = "D:/aosp/android-12.0.0_r1"

 

# 2. 设置 git 安装的路径

git = "C:/Program Files/Git/bin/git.exe"

# 3. 修改为第一步中 manifest 中 default.xml 保存的路径

dom = xml.dom.minidom.parse("D:/aosp/manifest/default.xml")

root = dom.documentElement

 

#prefix = git + " clone https://android.googlesource.com/"

# 4. 没有梯子使用清华源下载

prefix = git + " clone https://aosp.tuna.tsinghua.edu.cn/"

suffix = ".git"  

if not os.path.exists(rootdir):  

    os.mkdir(rootdir)  

for node in root.getElementsByTagName("project"):  

    os.chdir(rootdir)  

    d = node.getAttribute("path")  

    last = d.rfind("/")  

    if last != -1:  

        d = rootdir + "/" + d[:last]  

        if not os.path.exists(d):  

            os.makedirs(d)  

        os.chdir(d)  

    cmd = prefix + node.getAttribute("name") + suffix  

    call(cmd)
