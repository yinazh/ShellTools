#!/system/bin/sh

set -e

APPPATH="/data/data/com.ea.aiot.falconlauncher"
if [ ! -d "${APPPATH}" ]
then
   echo FalconLauncher未安装
   echo 0
   exit 0
fi

echo 进入FalconLauncher数据库文件夹
DBPATH="${APPPATH}/databases"
cd ${DBPATH}
pwd

echo
echo 执行清除操作

DBNAME="zigbee"
DBTABLE="SecurityEntity"
echo 数据库：${DBNAME}
echo 表：${DBTABLE}

echo
echo 开始清除数据...
sqlite3 ${DBNAME} << EOF
delete from ${DBTABLE};
.quit
EOF
echo 清除完成

echo 1
exit 0