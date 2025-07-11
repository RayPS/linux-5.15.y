ccflags-y += -DCONFIG_RTL8822C

ifeq ($(CONFIG_MP_INCLUDED), y)
### 8822C Default Enable VHT MP HW TX MODE ###
#ccflags-y += -DCONFIG_MP_VHT_HW_TX_MODE
#CONFIG_MP_VHT_HW_TX_MODE = y
endif

_HAL_INTFS_FILES +=	hal/rtl8822c/rtl8822c_halinit.o \
			hal/rtl8822c/rtl8822c_mac.o \
			hal/rtl8822c/rtl8822c_cmd.o \
			hal/rtl8822c/rtl8822c_phy.o \
			hal/rtl8822c/rtl8822c_ops.o \
			hal/rtl8822c/hal8822c_fw.o

ifeq ($(CONFIG_USB_HCI), y)
_HAL_INTFS_FILES +=	hal/rtl8822c/$(HCI_NAME)/rtl8822cu_halinit.o \
			hal/rtl8822c/$(HCI_NAME)/rtl8822cu_halmac.o \
			hal/rtl8822c/$(HCI_NAME)/rtl8822cu_io.o \
			hal/rtl8822c/$(HCI_NAME)/rtl8822cu_xmit.o \
			hal/rtl8822c/$(HCI_NAME)/rtl8822cu_recv.o \
			hal/rtl8822c/$(HCI_NAME)/rtl8822cu_led.o \
			hal/rtl8822c/$(HCI_NAME)/rtl8822cu_ops.o

_HAL_INTFS_FILES +=hal/efuse/rtl8822c/HalEfuseMask8822C_USB.o
endif
ifeq ($(CONFIG_PCI_HCI), y)
_HAL_INTFS_FILES +=	hal/rtl8822c/$(HCI_NAME)/rtl8822ce_halinit.o \
			hal/rtl8822c/$(HCI_NAME)/rtl8822ce_halmac.o \
			hal/rtl8822c/$(HCI_NAME)/rtl8822ce_io.o \
			hal/rtl8822c/$(HCI_NAME)/rtl8822ce_xmit.o \
			hal/rtl8822c/$(HCI_NAME)/rtl8822ce_recv.o \
			hal/rtl8822c/$(HCI_NAME)/rtl8822ce_led.o \
			hal/rtl8822c/$(HCI_NAME)/rtl8822ce_ops.o

_HAL_INTFS_FILES +=hal/efuse/rtl8822c/HalEfuseMask8822C_PCIE.o
endif
ifeq ($(CONFIG_SDIO_HCI), y)
_HAL_INTFS_FILES +=	hal/rtl8822c/$(HCI_NAME)/rtl8822cs_halinit.o \
			hal/rtl8822c/$(HCI_NAME)/rtl8822cs_halmac.o \
			hal/rtl8822c/$(HCI_NAME)/rtl8822cs_io.o \
			hal/rtl8822c/$(HCI_NAME)/rtl8822cs_xmit.o \
			hal/rtl8822c/$(HCI_NAME)/rtl8822cs_recv.o \
			hal/rtl8822c/$(HCI_NAME)/rtl8822cs_led.o \
			hal/rtl8822c/$(HCI_NAME)/rtl8822cs_ops.o

_HAL_INTFS_FILES +=hal/efuse/rtl8822c/HalEfuseMask8822C_SDIO.o

_HAL_INTFS_FILES +=hal/hal_hci/hal_sdio_coex.o
endif

include $(src)/halmac.mk

_BTC_FILES += hal/btc/halbtc8822cwifionly.o
ifeq ($(CONFIG_BT_COEXIST), y)
_BTC_FILES += hal/btc/halbtccommon.o \
				hal/btc/halbtc8822c.o
endif
