include sln.make
.PHONY:all dep dirs echo_t clean cleanobj cleandep cleantarget install
Target := all
include $(makebasedir)/recursedir.make 
Target := dirs
include $(makebasedir)/recursedir.make 
Target := dep
include $(makebasedir)/recursedir.make 
Target := clean
include $(makebasedir)/recursedir.make 
Target := cleantarget
include $(makebasedir)/recursedir.make 
Target := cleanobj
include $(makebasedir)/recursedir.make 
Target := cleandep
include $(makebasedir)/recursedir.make 
Target := echo_t
include $(makebasedir)/recursedir.make 
Target := install
include $(makebasedir)/recursedir.make 
