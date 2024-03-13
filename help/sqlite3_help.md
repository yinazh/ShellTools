# Sqlite3常用指令帮助
```
## 创建并打开数据库
$ sqlite3 text.db

##查看数据库文件信息
$.database

##查看所有表的创建语句
$.schema

##查看指定表的创建语句
$.schema [table_name]

##以sql语句的形式列出表内容
$.dump table_name

##设置显示信息的分隔符
$.separator symble
##设置显示信息以‘：’分割
$.separator :  
##设置显示信息以空格分割
$.separator “     ” 

##设置显示模式
$.mode [list/column/html/box/line/markdown/table/tabs/json]

## 查询后显示表头部信息
$.header on

##导出表
$.mode cvs

## 退出sqlite终端
$.exit
$.quit
```