
ifneq ($(wildcard sln.make),)
include $(makebasedir)/make_sln.make
else
ifneq ($(wildcard prj.make),)
include $(makebasedir)/make_prj.make
else 
#do nothing TODO:可以加个日
endif
endif
