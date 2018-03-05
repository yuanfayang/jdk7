#!/bin/bash
#设置语言
export LANG=C
#这里设置jdk目录
export ALT_BOOTDIR=/usr/java/jdk1.8.0_141
#允许自动下载依赖包
export ALLOW_DOWNLOADS=true
#使用预编译头文件，不加这个编译会更慢
export USE_PRECOMPILED_HEADER=true
#要编译的内容
export BUILD_LANGTOOLS=true
export BUILD_JAXP=true
export BUILD_JAXWS=true
export BUILD_CORBA=true
export BUILD_HOSTPOT=true
export BUILD_JDK=true
#要编译的版本
export SKIP_DEBUG_BUILD=false
export SKIP_FASTDEBUG_BUILD=true
export DEBUG_NAME=debug
#把它设置为FALSE可以避免javaws和浏览器Java插件之类的部分build
BUILD_DEPLOY=false
#把它设置为false就不会build出安装包。因为安装包里有一些奇怪的依赖
#但即便不build出它也已经得到完整的JDK镜像,所以还是不用build它
BUILD_INSTALL=false
#存放编译结果
export ALT_OUTPUTDIR=/home/nemo/openjdk-source/build
unset CLASSPATH
unset JAVA_HOME
#用来检查前面做做的设置是否正确
make sanity
make 2>&1 | tee $ALT_OUTPUTDIR/build.log