include $(makebasedir)/prj_relative_path_8.make
OutputType = exe
OutDir  := $(SolutionDir)/bin/$(Configuration)/$(RelativePrjDir)
IntDir      := $(SolutionDir)/temp/$(Configuration)/$(RelativePrjDir)
#AdditionalIncludeDir := $(SolutionDir)/errhandle $(SolutionDir)/warppedfunc $(SolutionDir)/clistr
AdditionalDependencies :=  clistr wrappedfunc errhandle
AdditionalLibraryDir := $(SolutionDir)/lib

