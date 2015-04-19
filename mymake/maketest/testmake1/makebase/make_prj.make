#include $(makebasedir)/global_prj.make
#用search替代直接include
SEARCHINCFILE	:= global_prj.make
include $(makebasedir)/search_inc_file_$(SEARCHINCLVL).make

include prj.make
.PHONY:all dep dirs echo_t clean cleanobj cleandep cleantarget install
#生成头文件搜索语法
includedir := $(AdditionalIncludeDir)
includedir += $(G_AdditionalLibraryDir)
includedir := $(addprefix -I,$(includedir))
#生成依赖库语法
prjdependencies :=$(AdditionalDependencies)
prjdependencies :=$(addprefix -l,$(prjdependencies))
#区分链接不同类型的库
ifeq ($(OutputType),dll)
prjdependencies := $(addsuffix $(CfgTag).$(SlibSuffix),$(prjdependencies))
else
prjdependencies := $(addsuffix $(CfgTag),$(prjdependencies))
endif
glodependencies := $(G_AdditionalDependencies)
glodependencies := $(addprefix -l,$(glodependencies))
alldenpendencies := $(prjdependencies) $(glodependencies)
#生成搜索库语法
alladditioanlibrary := $(AdditionalLibraryDir) $(G_AdditionalLibraryDir)
alladditioanlibrary := $(addprefix -L,$(alladditioanlibrary))
#生成不同dep文件的标志
cmndepflag 	:= 0
dlldepflag 	:= 0
alldepfiles 	:= 
#
srcfiles 	:= $(wildcard $(SrcDir)/*.$(SrcExt) )
depfiles 	:= $(patsubst $(SrcDir)/%.$(SrcExt),$(IntDir)/%.$(DepExt)$(CfgTag),$(srcfiles))
sdepfiles 	:= $(patsubst $(SrcDir)/%.$(SrcExt),$(IntDir)/%.$(SDepExt)$(CfgTag),$(srcfiles))
objfiles 	:= $(patsubst $(SrcDir)/%.$(SrcExt),$(IntDir)/%.$(ObjExt)$(CfgTag),$(srcfiles))
sobjfiles 	:= $(patsubst $(SrcDir)/%.$(SrcExt),$(IntDir)/%.$(SObjExt)$(CfgTag),$(srcfiles))

#推到TargetName和OutDir
#SolutionDir := /mnt/shared/test/cpp/maketest/testmake1
#curdir :=$(shell pwd)
#ProjectName := $(notdir $(curdir))
#TargetName := $(ProjectName)
#UPPERDIR:= $(notdir $(patsubst %/,%,$(dir $(curdir))))
#ifeq ($(SolutionDir)/$(ProjectName),$(curdir))
#RelativePrjDir := $(ProjectName)
#endif
#upper_dir1 := $(dir $(curdir))
#upper1 := $(notdir $(patsubst %/,%,$(upper_dir1)))
#justatest
multidir := . you my
multifiles := $(foreach dir,$(multidir),$(wildcard $(dir)/*.$(SrcExt) ))

#make lib
ifeq ($(strip $(OutputType)),lib)
TargetExtension := $(LibExtension)
TargetName := lib$(ProjectName)$(CfgTag).$(TargetExtension)
Targetpathlib := $(OutDir)/$(TargetName)
TargetExtension := $(SlibExtension)
TargetName := lib$(ProjectName)$(CfgTag).$(TargetExtension)
#为了生成dll而设置的
Targetpathslib := $(OutDir)/$(TargetName)
all:$(Targetpathlib) $(Targetpathslib)

$(Targetpathlib): $(objfiles)
	@echo ====Making lib for common use ...====
	$(AR) $(ARFlag) $@ $(objfiles)
	$(RANLIB) $@
$(Targetpathslib): $(sobjfiles)
	@echo ====Making lib for dll use ...====
	$(AR) $(ARFlag) $@ $(sobjfiles)
	$(RANLIB) $@

cmndepflag := 1
dlldepflag := 1
alldepfiles := $(depfiles) $(sdepfiles)
#EOF make lib
else
#make exe
ifeq ($(strip $(OutputType)), exe)
TargetName := $(ProjectName)$(CfgTag)
all: $(OutDir)/$(TargetName)
$(OutDir)/$(TargetName):$(objfiles)
	@echo ==== making exe file ... ====
	$(CC) $(DEFINEs) $(CCFlag) -rdynamic -ldl -o $@ $(objfiles) $(includedir) $(alldenpendencies) $(alladditioanlibrary) $(LNFlag)
cmndepflag := 1
dlldepflag := 0
alldepfiles := $(depfiles) 
#EOF of make exe
else
ifeq ($(strip $(OutputType)), dll)
#make dll
TargetExtension := so
TargetName := $(ProjectName)$(CfgTag).$($TargetExtension)
all:(OutDir)/$(TargetName)
$(OutDir)/$(TargetName):$(sobjfiles)
	@echo ==== making dll file ...====
	$(CC) $(DEFINEs) $(CCFlag) -o $@ $(sobjfiles) $(includedir) $(SOLNFlag) $(alldenpendencies) $(alladditioanlibrary) $(LNFlag) $(SOLNFlag)

cmndepflag := 0
dlldepflag := 1
alldepfiles := $(sdepfiles) 
#EOF of make dll
else
all:
	@echo "do not support this type $(OutputType) ProjectName=$(ProjectName)"
endif
#EOF of if exe
endif
#EOF of if lib
endif

dep:$(alldepfiles)
	@echo "make dep done ^^)"
#%.$(DepExt):%.$(SrcExt)
#	$(CC) $(DEFINEs) -MM -MT "$(patsubst %.$(DepExt),%.$(ObjExt),$@) $@" -MF $@ $<
#	@echo -e "\t$(CC) $(DEFINEs) $(CCFlag) -o $(patsubst %.$(ObjExt),%.$(DepExt),$@) -c $< " >> $@
#	TODO: modified it

ifeq ($(cmndepflag),1)
$(IntDir)/%.$(DepExt)$(CfgTag): $(SrcDir)/%.$(SrcExt)
	$(CC) $(DEFINEs) -MM -MT "$(patsubst %.$(DepExt)$(CfgTag),%.$(ObjExt)$(CfgTag),$@) $@" -MF $@ $<
	@echo -e "\t$(CC) $(DEFINEs) $(CCFlag) -o $(patsubst %.$(DepExt)$(CfgTag),%.$(ObjExt)$(CfgTag),$@) -c $<" >> $@
else
%.d:%.cpp
	@echo "iamc"
endif
ifeq ($(dlldepflag),1)
$(IntDir)/%.$(SDepExt)$(CfgTag): $(SrcDir)/%.$(SrcExt)
	$(CC) $(DEFINEs) -MM -MT "$(patsubst %.$(SDepExt)$(CfgTag),%.$(SObjExt)$(CfgTag),$@) $@" -MF $@ $<
	@echo -e "\t$(CC) $(DEFINEs) $(CCFlag) $(SOCCFlag) -o $(patsubst %.$(SDepExt)$(CfgTag),%.$(SObjExt)$(CfgTag),$@) -c $<" >> $@
endif
#包含dep文件,动态计算而不是根据源文件计算
incdepfiles := $(wildcard $(IntDir)/*.$(DepExt)$(CfgTag))
ifneq ($(incdepfiles),)
include $(incdepfiles)
endif
incsdepfiles := $(wildcard *.$(SDepExt)$(CfgTag))
ifneq ($(incsdepfiles),)
include $(incsdepfiles)
endif

dirint:
ifneq ( $(IntDir),)
ifeq ($(wildcard $(IntDir)),)
	$(MKDIR)  $(IntDir)
endif
endif
dirout:
ifneq ($(OutDir),)
ifeq ($(wildcard $(OutDir)),)
	$(MKDIR) $(OutDir)
endif
endif

dirs:dirint dirout
	@echo "mkdirs is done ^^)"

clean:cleantarget cleanobj cleandep
	$(RM) *.$(SObjExt)
	$(RM) *.$(SDepExt)
	$(RM) *.$(ObjExt)
	$(RM) *.$(DepExt)
cleantarget:
	$(RM) $(OutDir)/$(TargetName)
cleanobj:
	$(RM) $(IntDir)/*.$(ObjExt)
	$(RM) $(IntDir)/*.$(SObjExt)
cleandep:
	$(RM) $(IntDir)/*.$(DepExt)
	$(RM) $(IntDir)/*.$(SDepExt)
#安装文件
ifeq ($(OutputType),exe)
install:
	$(SURECP) $(OutDir)/$(TargetName) $(InstallDir)
else
ifeq ($(OutputType),dll)
install:
	$(SURECP) $(OutDir)/$(TargetName) $(InstallDir)
endif
endif
echo_t:
	@echo "srcfiles=$(srcfiles)"
	@echo "multifiles := $(multifiles)"
	@echo "alldepfiles := $(alldepfiles)"
	@echo "OutputType=$(OutputType)"
	@echo "ObjExt = $(ObjExt)"
	@echo "ProjectName := $(ProjectName)"
	@echo "TargetName := $(TargetName)"
	@echo "cmndepflag := $(cmndepflag)"
	@echo "dlldepflag := $(dlldepflag)"
	@echo "IntDir := $(IntDir)"
	@echo "OutDir := $(OutDir)"
	@echo "SrcDir := $(SrcDir)"
	@echo "RelativeDir := $(RelativePrjDir)"
	@echo "includedir := $(includedir)"
	@echo "includedir := $(includedir)"
	@echo "alldenpendencies := $(alldenpendencies)"
	@echo "AdditionalDependencies := $(AdditionalDependencies)"
	@echo "alladditioanlibrary := $(alladditioanlibrary)"

