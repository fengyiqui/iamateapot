include $(makebasedir)/prj_relative_path_8.make
OutputType = lib
#OutDir  := $(SolutionDir)/bin/$(Configuration)/$(RelativePrjDir)
OutDir  := $(SolutionDir)/lib
IntDir      := $(SolutionDir)/temp/$(Configuration)/$(RelativePrjDir)
AdditionalIncludeDir := $(SolutionDir)/errhandle $(SolutionDir)/warppedfunc 
AdditionalDependencies := errhandle wrappedfunc
AdditionalLibraryDir := $(SolutionDir)/lib
