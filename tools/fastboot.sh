#!/bin/sh

alias fastOemUnlock='fastboot.exe oem unlock'

alias fastRebot='fastboot.exe reboot'
alias fastBootloader='fastboot.exe reboot-bootloader'
alias fastDevice='fastboot.exe devices'

alias fastDevicesState='fastboot.exe getvar devices-state'
alias fastAllDeviceState='fastboot.exe getvar all'

alias fastUnlock='fastboot.exe flashing unlock'
alias fastLock='fastboot.exe flashing lock'

alias fastFlashSystem='fastboot.exe flash system system.img'
alias fastFlashBoot='fastboot.exe flash boot boot.img'
alias fastFlashSuper='fastboot.exe flash super super.img'

alias fastFormatData='fastboot.exe format data'
alias fastEraseBoot='fastboot.exe erase boot'
alias fastEraseCache='fastboot.exe erase cache'
alias fastEraseSystem='fastboot.exe erase system'
alias fastEraseUserData='fastboot.exe erase userdata'

