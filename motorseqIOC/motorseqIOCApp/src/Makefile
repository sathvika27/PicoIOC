TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = motorseqIOC
# motorseqIOC.dbd will be created and installed
DBD += motorseqIOC.dbd

# motorseqIOC.dbd will be made up from these files:
motorseqIOC_DBD += base.dbd
motorseqIOC_DBD += myAsynRegistration.dbd


# Include dbd files from all support applications:
motorseqIOC_DBD += asyn.dbd
motorseqIOC_DBD += stream.dbd
motorseqIOC_DBD += devSequencer.dbd

# Add all the support libraries needed by this IOC
motorseqIOC_LIBS += asyn
motorseqIOC_LIBS += stream
motorseqIOC_LIBS += seq


# motorseqIOC_registerRecordDeviceDriver.cpp derives from motorseqIOC.dbd
motorseqIOC_SRCS += motorseqIOC_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
motorseqIOC_SRCS_DEFAULT += motorseqIOCMain.cpp
motorseqIOC_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#motorseqIOC_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
motorseqIOC_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

