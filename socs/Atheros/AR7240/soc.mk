
#XXX testing
LZMA=lzma
KERNEL_PATH=/usr/obj/kernel

TARGET=			mips
TARGET_ARCH=		mips

KERNCONF_MACHINE=	${TARGET} ${TARGET_ARCH}
KERNCONF_IDENT?=	AR7240
KERNCONF_CPU=		CPU_MIPS24K

KERNCONF_FILES+=	"../atheros/files.ar71xx"
KERNCONF_HINTS=		"AR7240.hints"


KERNCONF_MAKEOPTIONS+=	"MIPS_BIG_ENDIAN=defined"


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

# Debug definitions
##KERNCONF_MAKEOPTIONS+=	"DEBUG=-g"
KERNCONF_OPTIONS+=		DDB
KERNCONF_OPTIONS+=		KDB
#KERNCONF_OPTIONS+=		PREEMPTION
##KERNCONF_OPTIONS+=		KTRACE
#KERNCONF_OPTIONS+=		LOCK_PROFILING
#KERNCONF_OPTIONS+=		KTR

# Board definitions
KERNCONF_OPTIONS+=	INET
KERNCONF_OPTIONS+= 	IPSTEALTH
KERNCONF_OPTIONS+= 	CD9660
#KERNCONF_OPTIONS+= 	GEOM_LABEL
#KERNCONF_OPTIONS+= 	SCHED_ULE
KERNCONF_OPTIONS+= 	SCHED_4BSD
KERNCONF_OPTIONS+= 	PSEUDOFS
KERNCONF_OPTIONS+=	IPFIREWALL_DEFAULT_TO_ACCEPT
KERNCONF_OPTIONS+=	_KPOSIX_PRIORITY_SCHEDULING


#KERNCONF_OPTIONS+=	NFSCLIENT
#KERNCONF_OPTIONS+=	NFS_ROOT
#KERNCONF_OPTIONS+= 	BOOTP
#KERNCONF_OPTIONS+= 	BOOTP_NFSROOT
#KERNCONF_OPTIONS+= 	BOOTP_NFSV3
#KERNCONF_OPTIONS+= 	BOOTP_WIRED_TO=arge0
#KERNCONF_OPTIONS+= 	BOOTP_COMPAT
KERNCONF_OPTIONS+=	ROOTDEVNAME=\\\"cd9660:/dev/map/rootfs.uzip\\\"


KERNCONF_DEVICES+=	ar71xx_apb

KERNCONF_DEVICES+=	uart
KERNCONF_DEVICES+=	uart_ar71xx
KERNCONF_DEVICES+=	random
KERNCONF_DEVICES+=	loop
KERNCONF_DEVICES+=	pty
KERNCONF_DEVICES+=	ether
KERNCONF_DEVICES+=	bpf
KERNCONF_DEVICES+=	vlan
KERNCONF_DEVICES+=	uart
KERNCONF_DEVICES+=	tuntap

KERNCONF_DEVICES+=	ar724x_pci
KERNCONF_DEVICES+=	pci
KERNCONF_DEVICES+=	ar71xx_wdog

KERNCONF_DEVICES+=	spibus
KERNCONF_DEVICES+=	ar71xx_spi
KERNCONF_DEVICES+=	mx25l

KERNCONF_DEVICES+=	arge
KERNCONF_DEVICES+=	mii

KERNCONF_OPTIONS+=	ARGE_MDIO
KERNCONF_DEVICES+=	miiproxy
KERNCONF_DEVICES+=	etherswitch
KERNCONF_DEVICES+=	arswitch
WORLD_SUBDIRS_SBIN+=	etherswitchcfg

KERNCONF_DEVICES+=	gpio
KERNCONF_DEVICES+=	gpioled

KERNCONF_DEVICES+=	geom_map
KERNCONF_DEVICES+=	xz
KERNCONF_DEVICES+=	geom_uzip

KERNCONF_OPTIONS+=	SCSI_DELAY=1000

.if defined(WITH_IPSEC)
KERNCONF_OPTIONS+=         IPSEC

KERNCONF_DEVICES+=		enc
#KERNCONF_DEVICES+=		gif
KERNCONF_DEVICES+=		ipsec
KERNCONF_DEVICES+=		crypto
#KERNCONF_DEVICES+=		cryptodev	# /dev/crypto for access to h/w

##KERNCONF_DEVICES+=		rndtest		# FIPS 140-2 entropy tester
.endif

.if defined(WITH_USB)
KERNCONF_DEVICES+=	usb
#KERNCONF_OPTIONS+=	USB_EHCI_BIG_ENDIAN_DESC
#KERNCONF_OPTIONS+=	USB_DEBUG
KERNCONF_DEVICES+=	ehci
#KERNCONF_DEVICES+=	ohci
.endif
