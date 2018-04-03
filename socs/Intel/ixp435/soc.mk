
#XXX testing
KERNEL_PATH=/usr/obj/kernel

TARGET=			arm
TARGET_ARCH=		armeb

KERNCONF_MACHINE=	${TARGET} ${TARGET_ARCH}
KERNCONF_IDENT?=	IXP435
KERNCONF_CPU+= 		CPU_XSCALE_IXP435
KERNCONF_CPU+= 		CPU_XSCALE_IXP425
KERNCONF_HINTS=		"ixp425.hints"
KERNCONF_FILES+=	"../xscale/ixp425/files.ixp425"
KERNCONF_FILES+=	"../xscale/ixp425/files.avila"

KERNCONF_MAKEOPTIONS+=	"ARM_BIG_ENDIAN"
KERNCONF_MAKEOPTIONS+=	"KERNPHYSADDR=0x00200000"
KERNCONF_MAKEOPTIONS+=	"KERNVIRTADDR=0xc0200000"

KERNCONF_OPTIONS+=	ARM_CACHE_LOCK_ENABLE
KERNCONF_OPTIONS+= 	XSCALE_CACHE_READ_WRITE_ALLOCATE
KERNCONF_OPTIONS+= 	HZ=100
KERNCONF_OPTIONS+= 	DEVICE_POLLING
KERNCONF_OPTIONS+= 	HWPMC_HOOKS
KERNCONF_OPTIONS+= 	VERBOSE_INIT_ARM
KERNCONF_OPTIONS+= 	IXP4XX_FLASH_SIZE=0x00400000
KERNCONF_OPTIONS+= 	ATA_CAM
#KERNCONF_OPTIONS+= 	ATA_STATIC_ID
KERNCONF_OPTIONS+= 	USB_EHCI_BIG_ENDIAN_DESC
KERNCONF_OPTIONS+=	NO_EVENTTIMERS

KERNCONF_OPTIONS+=	PHYSADDR=0x00000000
KERNCONF_OPTIONS+=	KERNPHYSADDR=0x00200000
KERNCONF_OPTIONS+=	KERNVIRTADDR=0xc0200000
KERNCONF_OPTIONS+=	FLASHADDR=0x50000000
KERNCONF_OPTIONS+=	LOADERRAMADDR=0x00000000
KERNCONF_OPTIONS+=	STARTUP_PAGETABLE_ADDR=0x00000000



KERNCONF_OPTIONS+=		MAXUSERS=3
KERNCONF_OPTIONS+=		MAXFILES=512
KERNCONF_OPTIONS+=		NSFBUFS=1024
KERNCONF_OPTIONS+=		SHMALL=128
KERNCONF_OPTIONS+=		MSGBUF_SIZE=65536

# Options for making kernel smallest 
KERNCONF_OPTIONS+=		NO_SYSCTL_DESCR
KERNCONF_OPTIONS+=		NO_FFS_SNAPSHOT
KERNCONF_OPTIONS+=		SCSI_NO_SENSE_STRINGS
KERNCONF_OPTIONS+=		SCSI_NO_OP_STRINGS
KERNCONF_MAKEOPTIONS+=	"CONF_CFLAGS=-mcpu=xscale"


# Debug definitions
##KERNCONF_MAKEOPTIONS+=	"DEBUG=-g"
KERNCONF_OPTIONS+=		DDB
KERNCONF_OPTIONS+=		KDB
KERNCONF_OPTIONS+=		PREEMPTION
##KERNCONF_OPTIONS+=		KTRACE
#KERNCONF_OPTIONS+=		LOCK_PROFILING
#KERNCONF_OPTIONS+=		KTR

# Board definitions
KERNCONF_OPTIONS+=	INET
KERNCONF_OPTIONS+= 	IPSTEALTH
KERNCONF_OPTIONS+= 	FFS
KERNCONF_OPTIONS+= 	SOFTUPDATES
KERNCONF_OPTIONS+= 	UFS_ACL
KERNCONF_OPTIONS+= 	UFS_DIRHASH
#KERNCONF_OPTIONS+= 	TMPFS
KERNCONF_OPTIONS+= 	CD9660
#KERNCONF_OPTIONS+= 	GEOM_LABEL
KERNCONF_OPTIONS+= 	SCHED_ULE
#KERNCONF_OPTIONS+= 	SCHED_4BSD
#KERNCONF_OPTIONS+= 	NFSCLIENT
#KERNCONF_OPTIONS+= 	NFS_ROOT
KERNCONF_OPTIONS+= 	PSEUDOFS
KERNCONF_OPTIONS+=	IPFIREWALL_DEFAULT_TO_ACCEPT
KERNCONF_OPTIONS+=	_KPOSIX_PRIORITY_SCHEDULING

#KERNCONF_OPTIONS+= 	SMP

KERNCONF_DEVICES+=	pci
KERNCONF_DEVICES+=	random
KERNCONF_DEVICES+=	loop
KERNCONF_DEVICES+=	pty
KERNCONF_DEVICES+=	ether
KERNCONF_DEVICES+=	bpf
KERNCONF_DEVICES+=	vlan
KERNCONF_DEVICES+=	uart
KERNCONF_DEVICES+=	tun

KERNCONF_OPTIONS+= 	SC_PIXEL_MODE

KERNCONF_OPTIONS+= 	CAMDEBUG

KERNCONF_DEVICES+=	\
	hwpmc		\
	ixpwdog		\
	cfi		\
	cfid		\
	geom_redboot	\
	gpioiic		\
	iicbus		\
	iicbb		\
	iic		\
	gpio		\
	gpioled		\
	npe		\
	npe_fw		\
	firmware	\
	qmgr		\
	re		\
	mii		\
	md		\
	usb		\
	ehci		\
	umass		\
	atapci		\
	atacore		\
	atp8620		\
	scbus		\
	da		\
	pass

#	ixpiic
#	ds1672
#	ds133x
#	ad7418

#	atadisk
#	isa

#	ata
#	ahci
#	avila_ata
#	cambria_gpio
#	atapicam

# ATA controllers
#device		ahci		# AHCI-compatible SATA controllers
#device		ata		# Legacy ATA/SATA controllers
#options 	ATA_CAM		# Handle legacy controllers with CAM
#options 	ATA_STATIC_ID	# Static device numbering



KERNCONF_OPTIONS+=	SCSI_DELAY=1000

.if defined(WITH_IPSEC)
KERNCONF_OPTIONS+=         IPSEC

KERNCONF_DEVICES+=		enc
KERNCONF_DEVICES+=		ipsec
KERNCONF_DEVICES+=		crypto
.endif

WORLD_SUBDIRS+=			\
	sys/boot/arm/ixp425/boot2


