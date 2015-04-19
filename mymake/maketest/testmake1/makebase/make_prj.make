#include $(makebasedir)/global_prj.make
#��search���ֱ��include
SEARCHINCFILE	:= global_prj.make
include $(makebasedir)/search_inc_file_$(SEARCHINCLVL).make

include prj.make

.PHONY:all dep dirs echo_t clean cleanobj cleandep cleantarget install
#����ͷ�ļ������﷨
includedir := $(AdditionalIncludeDir)
includedir += $(G_AdditionalLibraryDir)
includedir := $(addprefix -I,$(includedir))
#�����������﷨
prjdependencies :=$(AdditionalDependencies)
prjdependencies :=$(addprefix -l,$(prjdependencies))
#�������Ӳ�ͬ���͵Ŀ�
ifeq ($(OutputType),dll)
prjdependencies := $(addsuffix $(CfgTag).$(SlibSuffix),$(prjdependencies))
else
prjdependencies := $(addsuffix $(CfgTag),$(prjdependencies))
endif
glodependencies := $(G_AdditionalDependencies)
glodependencies := $(addprefix -l,$(glodependencies))
alldenpendencies := $(prjdependencies) $(glodependencies)
#�����������﷨
alladditioanlibrary := $(AdditionalLibraryDir) $(G_AdditionalLibraryDir)
alladditioanlibrary := $(addprefix -L,$(alladditioanlibrary))
#���ɲ�ͬdep�ļ��ı�־
cmndepflag 	:= 0
dlldepflag 	:= 0
alldepfiles 	:= 
#
srcfiles 	:= $(wildcard $(SrcDir)/*.$(SrcExt) )
depfiles 	:= $(patsubst $(SrcDir)/%.$(SrcExt),$(IntDir)/%.$(DepExt)$(CfgTag),$(srcfiles))
sdepfiles 	:= $(patsubst $(SrcDir)/%.$(SrcExt),$(IntDir)/%.$(SDepExt)$(CfgTag),$(srcfiles))
objfiles 	:= $(patsubst $(SrcDir)/%.$(SrcExt),$(IntDir)/%.$(ObjExt)$(CfgTag),$(srcfiles))
sobjfiles 	:= $(patsubst $(SrcDir)/%.$(SrcExt),$(IntDir)/%.$(SObjExt)$(CfgTag),$(srcfiles))

#�Ƶ�TargetName��OutDir
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
#Ϊ������dll�����õ�
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
#����dep�ļ�,��̬��������Ǹ���Դ�ļ�����
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
	@echo "clean is done ^^)"
ifeq ($(OutputType),exe)
cleantarget:
	$(RM) $(OutDir)/$(TargetName)
else
cleantarget:
	$(RM) $(OutDir)/$(TargetName)
	$(RM) $(OutDir)/lib$(ProjectName)$(CfgTag).$(LibExtension)
endif
cleanobj:
	$(RM) $(IntDir)/*.$(ObjExt)$(CfgTag)
	$(RM) $(IntDir)/*.$(SObjExt)$(CfgTag)
cleandep:
	$(RM) $(IntDir)/*.$(DepExt)$(CfgTag)
	$(RM) $(IntDir)/*.$(SDepExt)$(CfgTag)
#��װ�ļ�
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
	@echo "CfgTag := $(CfgTag) LibExtension=$(LibExtension)"
