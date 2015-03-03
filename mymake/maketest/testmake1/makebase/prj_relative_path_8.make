#从global_prj.make中获得
loc_curdir :=$(shell pwd)
ProjectName := $(notdir $(loc_curdir))
#检测8级目录
upper_dir1 := $(patsubst %/,%,$(dir $(loc_curdir)))
upper1 := $(notdir $(upper_dir1))
upper_dir2 := $(patsubst %/,%,$(dir $(upper_dir1)))
upper2 := $(notdir $(upper_dir2))
upper_dir3 := $(patsubst %/,%,$(dir $(upper_dir2)))
upper3 := $(notdir $(upper_dir3))
upper_dir4 := $(dir $(patsubst %/,%,$(upper_dir3)))
upper4 := $(notdir $(upper_dir4))
upper_dir5 := $(dir $(patsubst %/,%,$(upper_dir4)))
upper5 := $(notdir $(upper_dir5))
upper_dir6 := $(dir $(patsubst %/,%,$(upper_dir5)))
upper6 := $(notdir $(upper_dir6))
upper_dir7 := $(dir $(patsubst %/,%,$(upper_dir6)))
upper7 := $(notdir $(upper_dir7))
upper_dir8 := $(dir $(patsubst %/,%,$(upper_dir7)))
upper8 := $(notdir $(upper_dir8))
loc_tmp_path :=$(ProjectName)
ifeq ($(SolutionDir)/$(loc_tmp_path),$(loc_curdir))
RelativePrjDir :=$(loc_tmp_path)
endif

loc_tmp_path :=$(upper1)/$(ProjectName)
ifeq ($(SolutionDir)/$(loc_tmp_path),$(loc_curdir))
RelativePrjDir :=$(loc_tmp_path)
endif
loc_tmp_path :=$(upper2)/$(upper1)/$(ProjectName)
ifeq ($(SolutionDir)/$(loc_tmp_path),$(loc_curdir))
RelativePrjDir :=$(loc_tmp_path)
endif
loc_tmp_path :=$(upper3)/$(upper2)/$(upper1)/$(ProjectName)
ifeq ($(SolutionDir)/$(loc_tmp_path),$(loc_curdir))
RelativePrjDir :=$(loc_tmp_path)
endif
loc_tmp_path :=$(upper4)/$(upper3)/$(upper2)/$(upper1)/$(ProjectName)
ifeq ($(SolutionDir)/$(loc_tmp_path),$(loc_curdir))
RelativePrjDir :=$(loc_tmp_path)
endif
loc_tmp_path :=$(upper5)/$(upper4)/$(upper3)/$(upper2)/$(upper1)/$(ProjectName)
ifeq ($(SolutionDir)/$(loc_tmp_path),$(loc_curdir))
RelativePrjDir :=$(loc_tmp_path)
endif
loc_tmp_path :=$(upper6)/$(upper5)/$(upper4)/$(upper3)/$(upper2)/$(upper1)/$(ProjectName)
ifeq ($(SolutionDir)/$(loc_tmp_path),$(loc_curdir))
RelativePrjDir :=$(loc_tmp_path)
endif
loc_tmp_path :=$(upper7)/$(upper6)/$(upper5)/$(upper4)/$(upper3)/$(upper2)/$(upper1)/$(ProjectName)
ifeq ($(SolutionDir)/$(loc_tmp_path),$(loc_curdir))
RelativePrjDir :=$(loc_tmp_path)
endif
loc_tmp_path :=$(upper8)/$(upper7)/$(upper6)/$(upper5)/$(upper4)/$(upper3)/$(upper2)/$(upper1)/$(ProjectName)
ifeq ($(SolutionDir)/$(loc_tmp_path),$(loc_curdir))
RelativePrjDir :=$(loc_tmp_path)
endif
#
#InstallDir  := $(SolutionDir)/bin/$(Configuration)/$(RelativePrjDir)
#IntDir      := $(SolutionDir)/temp/$(Configuration)/$(RelativePrjDir)
