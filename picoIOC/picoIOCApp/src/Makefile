TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = picoIOC
# picoIOC.dbd will be created and installed
DBD += picoIOC.dbd

# picoIOC.dbd will be made up from these files:
picoIOC_DBD += base.dbd
picoIOC_DBD += myAsynRegistration.dbd

# Include dbd files from all support applications:
picoIOC_DBD += asyn.dbd
picoIOC_DBD += stream.dbd


# Add all the support libraries needed by this IOC
picoIOC_LIBS += asyn
picoIOC_LIBS += stream

# picoIOC_registerRecordDeviceDriver.cpp derives from picoIOC.dbd
picoIOC_SRCS += picoIOC_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
picoIOC_SRCS_DEFAULT += picoIOCMain.cpp
picoIOC_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#picoIOC_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
picoIOC_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

