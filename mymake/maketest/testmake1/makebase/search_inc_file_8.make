
#
ifeq ($(wildcard $(SEARCHINCFILE)),)
SEARCHINCFILE := ../$(SEARCHINCFILE)
ifeq ($(wildcard $(SEARCHINCFILE)),)
SEARCHINCFILE := ../$(SEARCHINCFILE)
ifeq ($(wildcard $(SEARCHINCFILE)),)
SEARCHINCFILE := ../$(SEARCHINCFILE)
ifeq ($(wildcard $(SEARCHINCFILE)),)
SEARCHINCFILE := ../$(SEARCHINCFILE)
ifeq ($(wildcard $(SEARCHINCFILE)),)
SEARCHINCFILE := ../$(SEARCHINCFILE)
ifeq ($(wildcard $(SEARCHINCFILE)),)
SEARCHINCFILE := ../$(SEARCHINCFILE)
ifeq ($(wildcard $(SEARCHINCFILE)),)
SEARCHINCFILE := ../$(SEARCHINCFILE)
ifeq ($(wildcard $(SEARCHINCFILE)),)
# û�ҵ�
SEARCHINCFILE :=
endif
endif
endif
endif
endif
endif
endif
endif

ifneq ($(wildcard $(SEARCHINCFILE)),)
include $(SEARCHINCFILE)
endif

