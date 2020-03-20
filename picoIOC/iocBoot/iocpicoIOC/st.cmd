#!../../bin/linux-x86_64/picoIOC

## You may have to change picoIOC to something else
## everywhere it appears in this file

< envPaths
cd "${TOP}"
epicsEnvSet("PMC", "TEST_PMC")
epicsEnvSet("P", "Device")

epicsEnvSet("STREAM_PROTOCOL_PATH","${TOP}/protocols")

## Register all support components
dbLoadDatabase "dbd/picoIOC.dbd"
picoIOC_registerRecordDeviceDriver pdbbase
drvAsynIPPortConfigure("$(PMC)", "10.10.7.202:23")

## Load record instances
dbLoadRecords("db/general.db","P=$(P),AXIS=1,PORT=$(PMC),PMC=$(PMC)")
dbLoadRecords("db/axis.db","P=$(P),AXIS=1,PORT=$(PMC),PMC=$(PMC)")
dbLoadRecords("db/axis.db","P=$(P),AXIS=4,PORT=$(PMC),PMC=$(PMC)")


cd "${TOP}/iocBoot/${IOC}"
asynSetTraceMask("$(PMC)", -1, 0x9)
asynSetTraceIOMask("$(PMC)", -1, 0x9)

iocInit

## Start any sequence programs
#seq sncxxx,"user=epics"
