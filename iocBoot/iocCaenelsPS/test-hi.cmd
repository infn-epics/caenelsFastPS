#!../../bin/EPICS

< envPaths

epicsEnvSet ("PATH", "${PATH}:${TOP}/bin")
epicsEnvSet ("STREAM_PROTOCOL_PATH", ".:../../protocols")
epicsEnvSet("P","SPARC:MAG:HISTAR:")
epicsEnvSet("R","PLXVCR02:")

cd "${TOP}"

## Register all support components
dbLoadDatabase("dbd/CaenelsFastPS.dbd",0,0)
CaenelsFastPS_registerRecordDeviceDriver(pdbbase)

## Configure device
drvAsynIPPortConfigure("L0","192.168.0.9:10001",0,0,0)

## Load record instances
dbLoadRecords("db/caenels.db", "P=$(P),R=$(R),PORT=L0")
dbLoadRecords("db/unimag-caenels.db", "P=$(P),R=$(R),PORT=L0")

cd "${TOP}/iocBoot/${IOC}"
iocInit()
