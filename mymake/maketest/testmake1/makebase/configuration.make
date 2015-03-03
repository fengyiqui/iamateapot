#本文件列举使用的变量信息和默认值，这些值会在执行中通过inluce别的make文件改变
#
#make工具的绝对路径，需要写到环境变量里面
#makebasedir=
#make的目标，一般是伪目标
Target := all | dep | ...
#
#判定是debug还是release，在release.make debug.make中覆盖
Configuration := debug | release
#工程的类型
OutputType := exe | lib | dll
#目标文件或者中间文件的tab
CfgTag := _d | 
#-------------------------------------------
#sln.make中工程的集合，是顺序相关的，被依赖的工程必须在前面
Projects := prj1 prj2
#一般放在global_pjr.make中，是绝对路径
SolutionDir := 
#工程名
ProjectName := dirname 
#相对solution的工程目录，最短为工程名
RelativePrjDir := 
#输出文件名字
TargetName :=
TargetDir :=
#源文件相对project的位置，有的直接放在prj文件同目录,有的喜欢放到src下面
SrcDir := .
#全局的依赖库
G_AdditionalDependencies := 
#全局的依赖库搜索位置
G_AdditionalLibraryDir :=
#额外头文件包含目录
AdditionalIncludeDir :=
#额外依赖的库
AdditionalDependencies := 
#额外依赖库的文件夹
AdditionalLibraryDir := 
#中间文件的输出目录
IntDir := .
#文件输出目录
OutDir := .
#程序安装路径
InstallDir :=
#--------------------------------
SrcExt := cpp
DepExt := d
SDepExt := s.d
#动态库的obj文件末尾
SObjExt := s.obj
ObjExt := obj
#目标的文件后缀
TargetExtension := a |s.a | so |
LibExtension := a
SlibExtension := s.a
SlibSuffix := s
ExeExtension := 
DllExtension := so
#----------------命令----------------------
AR := ar
RANLIB := ranlib
CC := g++
DEFINEs := -DLINUX
# 如果是RH9的话就没有--preserve-root这个参数了
RM := rm --preserve-root -f
CP := cp
SURECP := $(makebasedir)/surecp.sh
MKDIR := mkdir -p
# 连接库需要的选项
ARFlag := crs
# 编译DLL需要的obj的编译选项
SOCCFlag := -fPIC
# 连接DLL的编译选项
SOLNFlag := -shared
# 编译选项
CCFlag := -Wall -g -D_DEBUG
#CCFlag := -finput-charset=gb2312 -Wall -g -D_DEBUG
# 连接选项
LNFlag := -lpthread
