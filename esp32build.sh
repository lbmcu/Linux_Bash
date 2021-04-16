#!/bin/bash

#烧录端口
COM_PORT=$1
#bin文件
file=$2
#工程目录
prjDir="/mnt/c/Users/ABC/Desktop/ESP32C3_MINI1/Code/esp-aws-iot/examples/subscribe_publish"
#烧录文件夹
desDir="/mnt/c/Users/ABC/Desktop/ESP32C3_MINI1/out"
#Windows下烧录文件夹
winDir="C:/Users/ABC/Desktop/ESP32C3_MINI1/out"

#烧录参数
buildFlag="-b 921600 --before default_reset --after hard_reset --chip esp32c3  write_flash --flash_mode dio --flash_size detect --flash_freq 40m 0x10000"

#判断参数
if [ $# != 2 ]
then
	echo "Usage: ./esp32build.sh [COMx] [Prj_Name]"
	exit
else
	echo "----------------------------------------"
fi

#进入工程目录
cd $prjDir

#创建烧录文件保存的文件夹
echo "------------- 1. Begin to create Build Folder  --------------"
if [ ! -d $desDir ]
then
	echo "$desDir is create!"
	mkdir -p $desDir
else
	echo "$desDir is exist!"
fi
echo -e "------------- 1. Ending to create Build Folder --------------\n"

# 拷贝文件
echo "------------- 2. Begin to Dect Bin file  --------------"
if [ ! -f $desDir/$file ]
then
	echo "$file is not here!"
	cp build/$file $desDir
else
	echo "$file is exist!"
	rm -rf $file
	cp build/$file $desDir
fi
echo -e "------------- 2. Ending to make Dect Bin file --------------\n"

# 执行Python烧录
echo "------------- 3. Begin to Burn Bin file  --------------"
cmd.exe /C D:/Anaconda3/python  $winDir/esptool.py -p $COM_PORT $buildFlag $winDir/$file
echo -e "------------- 3. Ending to make Burn Bin file --------------\n"