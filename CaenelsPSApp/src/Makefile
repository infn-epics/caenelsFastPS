TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = CaenelsPS
# CaenelsPS.dbd will be created and installed
DBD += CaenelsPS.dbd

# CaenelsPS.dbd will be made up from these files:
CaenelsPS_DBD += base.dbd

# Include dbd files from all support applications:
CaenelsPS_DBD += asyn.dbd
CaenelsPS_DBD += drvAsynIPPort.dbd
CaenelsPS_DBD += stream.dbd

# Add all the support libraries needed by this IOC
CaenelsPS_LIBS += asyn
CaenelsPS_LIBS += stream

# CaenelsPS_registerRecordDeviceDriver.cpp derives from CaenelsPS.dbd
CaenelsPS_SRCS += CaenelsPS_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
CaenelsPS_SRCS_DEFAULT += CaenelsPSMain.cpp
CaenelsPS_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#CaenelsPS_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
CaenelsPS_LIBS += $(EPICS_BASE_IOC_LIBS)
DATA += ../../protocols/fastps.proto
#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

