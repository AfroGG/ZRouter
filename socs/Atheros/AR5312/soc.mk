

TARGET=			mips
TARGET_ARCH=		mips

KERNCONF_MACHINE=	${TARGET} ${TARGET_ARCH}
KERNCONF_IDENT?=	AR5315
KERNCONF_CPU=		CPU_MIPS4KC
KERNCONF_FILES+=	"../atheros/ar531x/files.ar5315"

KERNCONF_OPTIONS+=	INTRNG

# XXX Maybe project definitions, maybe only board

KERNCONF_MAKEOPTIONS+=	"INLINE_LIMIT=768"
KERNCONF_KERNLOADADDR?=		0x80050000
KERNCONF_OPTIONS+=		HZ=1000
KERNCONF_OPTIONS+=		MAXFILES=512
KERNCONF_OPTIONS+=		SHMALL=128
KERNCONF_OPTIONS+=		MSGBUF_SIZE=65536

# Options for making kernel smallest 
KERNCONF_OPTIONS+=		NO_SYSCTL_DESCR		# No description string of sysctl
KERNCONF_OPTIONS+=		NO_FFS_SNAPSHOT		# Disable Snapshot supporting
KERNCONF_OPTIONS+=		SCSI_NO_SENSE_STRINGS
KERNCONF_OPTIONS+=		SCSI_NO_OP_STRINGS
#KERNCONF_OPTIONS+=		MUTEX_NOINLINE
KERNCONF_OPTIONS+=		RWLOCK_NOINLINE
KERNCONF_OPTIONS+=		SX_NOINLINE
KERNCONF_OPTIONS+=		NO_SWAPPING



# Debug definitions
KERNCONF_OPTIONS+=		DDB
KERNCONF_OPTIONS+=		KDB
#KERNCONF_OPTIONS+=		ALT_BREAK_TO_DEBUGGER
#KERNCONF_OPTIONS+=		KTRACE

# Custom build definitions
#KERNCONF_OPTIONS+=	NFSCLIENT
#KERNCONF_OPTIONS+=	NFS_ROOT
#KERNCONF_OPTIONS+= 	FFS
#KERNCONF_OPTIONS+= 	SOFTUPDATES
#KERNCONF_OPTIONS+= 	UFS_ACL
#KERNCONF_OPTIONS+= 	UFS_DIRHASH
#KERNCONF_OPTIONS+= 	UFS_GJOURNAL
#KERNCONF_OPTIONS+= 	MSDOSFS
#KERNCONF_OPTIONS+= 	PROCFS
#KERNCONF_OPTIONS+= 	BOOTP
#KERNCONF_OPTIONS+= 	BOOTP_NFSROOT
#KERNCONF_OPTIONS+= 	BOOTP_NFSV3
#KERNCONF_OPTIONS+= 	BOOTP_WIRED_TO=bfe0
#KERNCONF_OPTIONS+= 	BOOTP_COMPAT

KERNCONF_OPTIONS+=	AR531X_1ST_GENERATION

# Board definitions
KERNCONF_OPTIONS+=	INET
KERNCONF_OPTIONS+= 	TMPFS
KERNCONF_OPTIONS+= 	CD9660
#KERNCONF_OPTIONS+= 	GEOM_LABEL
#KERNCONF_DEVICES+=	geom_map
#KERNCONF_DEVICES+=	geom_redboot
KERNCONF_DEVICES+=	xz
KERNCONF_DEVICES+=	geom_uzip
#KERNCONF_DEVICES+=	nvram2env

# Project definitions
#KERNCONF_OPTIONS+=	SCHED_4BSD
KERNCONF_OPTIONS+=	SCHED_ULE
KERNCONF_OPTIONS+=	PSEUDOFS
KERNCONF_OPTIONS+=	_KPOSIX_PRIORITY_SCHEDULING


KERNCONF_DEVICES+=	uart
KERNCONF_DEVICES+=	uart_ar5315
KERNCONF_DEVICES+=	random
KERNCONF_DEVICES+=	loop
KERNCONF_DEVICES+=	ether
#KERNCONF_DEVICES+= 	tuntap
KERNCONF_DEVICES+= 	pty
#KERNCONF_DEVICES+= 	bpf
#KERNCONF_DEVICES+=	vlan
#KERNCONF_DEVICES+=	md
#KERNCONF_DEVICES+=	lagg
#KERNCONF_DEVICES+=     if_bridge

KERNCONF_DEVICES+=	mii

KERNCONF_DEVICES+=	gpio
KERNCONF_DEVICES+=	gpioled

KERNCONF_DEVICES+=	cfi
KERNCONF_DEVICES+=	cfid

KERNCONF_DEVICES+=	ar5315_wdog

KERNCONF_DEVICES+=	are

.if !defined(WITHOUT_WIRELESS)
KERNCONF_OPTIONS+=	IEEE80211_DEBUG
KERNCONF_OPTIONS+=	IEEE80211_SUPPORT_MESH
KERNCONF_OPTIONS+=	IEEE80211_SUPPORT_TDMA
KERNCONF_DEVICES+=	wlan
KERNCONF_DEVICES+=	wlan_amrr
KERNCONF_DEVICES+=	wlan_wep
KERNCONF_DEVICES+=	wlan_ccmp
KERNCONF_DEVICES+=	wlan_tkip

KERNCONF_OPTIONS+=	ATH_DEBUG
KERNCONF_OPTIONS+=	ATH_DIAGAPI
KERNCONF_OPTIONS+=	AH_DEBUG
KERNCONF_OPTIONS+=	ALQ
KERNCONF_OPTIONS+=	AH_DEBUG_ALQ
KERNCONF_OPTIONS+=	AH_AR5416_INTERRUPT_MITIGATION
KERNCONF_OPTIONS+=	AH_SUPPORT_AR5416
KERNCONF_OPTIONS+=	AH_RXCFG_SDMAMW_4BYTES
KERNCONF_DEVICES+=	ath
KERNCONF_DEVICES+=      ath_ahb
KERNCONF_DEVICES+=	ath_hal
KERNCONF_DEVICES+=	ath_rate_sample
KERNCONF_DEVICES+=      ath_ar5212
#KERNCONF_DEVICES+=      ath_ar5416
#KERNCONF_DEVICES+=      ath_ar9130
.endif

.if defined(WITH_IPSEC)
KERNCONF_OPTIONS+=      IPSEC

KERNCONF_DEVICES+=	enc
#KERNCONF_DEVICES+=	gif
KERNCONF_DEVICES+=	ipsec
KERNCONF_DEVICES+=	crypto
#KERNCONF_DEVICES+=	cryptodev

#KERNCONF_DEVICES+=	rndtest
.endif

