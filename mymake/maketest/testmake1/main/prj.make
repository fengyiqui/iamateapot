include $(makebasedir)/prj_relative_path_8.make
OutputType = exe
AdditionalIncludeDir := ../my ../you
AdditionalDependencies := you my
AdditionalLibraryDir := $(SolutionDir)/lib
OutDir  := $(SolutionDir)/bin/$(Configuration)/$(RelativePrjDir)
IntDir      := $(SolutionDir)/temp/$(Configuration)/$(RelativePrjDir)
InstallDir := $(SolutionDir)/install
