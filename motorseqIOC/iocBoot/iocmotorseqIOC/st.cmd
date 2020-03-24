#!../../bin/linux-x86_64/motorc

## You may have to change motorc to something else
## everywhere it appears in this file

< envPaths
cd "${TOP}"

epicsEnvSet("STREAM_PROTOCOL_PATH","${TOP}/protocols")

## Register all support components
dbLoadDatabase "dbd/motorc.dbd"
motorc_registerRecordDeviceDriver pdbbase
drvAsynIPPortConfigure("$(PORT)", "10.10.7.202:23")


## Load record instances
dbLoadRecords("db/motorDb.db","P = PicoDevice, AXIS = 1, PORT = $(PORT)")
dbLoadRecords("db/motorDb.db","P = PicoDevice, AXIS = 4, PORT = $(PORT)")


cd "${TOP}/iocBoot/${IOC}"
asynSetTraceMask("$(PORT)", -1, 0x9)
asynSetTraceIOMask("$(PORT)", -1, 0x9)

iocInit

## Start any sequence programs
#seq sncxxx,"user=epics"
