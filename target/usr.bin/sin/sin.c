/*
  http://rio.la.coocan.jp/lab/oss/000prologue.htm
*/

#include <fcntl.h>
#include <limits.h>
#include <sys/soundcard.h>
#include <math.h>
#include <stdio.h>
#include <sys/ioctl.h>
#include <unistd.h>

/*
 * �̻Ҳ��ӥåȿ� : 16 bits
 * ����ץ�󥰼��ȿ� : 44.1 KHz
 * �����ͥ�� : 1
 * �������� : 5 sec
 *
 * ʬ�ΥХåե��ΰ�
 *
 * 16 (bits) * 44100 (Hz) * 5 (sec) = 3528000 (bits)
 *                                  = 441000  (bytes)
 */
#define BUFSIZE 480000

static int setup_dsp( int fd, int be );

int 
main(int argc, char ** argv)
{
	/* �������� 5 �� */
	double total = 5.0, t; 

	/* ���������ȿ� 440 Hz ( A ) */
	double freq = 440.0;

	short  buf[ BUFSIZE / sizeof(short) ];
	int    fd, i;
	char   ch;
	int    silence = 0;
	int    bigendian = 0;

	while ((ch = getopt(argc, argv, "skb")) != -1) {
		if(ch == 's') {
			silence = 1;
		}
		if(ch == 'k') {
			freq = 1000.0;
		}
		if(ch == 'b') {
			bigendian = 1;
		}
	}

	if ( ( fd = open( "/dev/dsp", O_WRONLY ) ) == -1 ) {
		perror( "open()" );
		return 1;
	}


	/* /dev/dsp ������ */
	if ( setup_dsp( fd, bigendian ) != 0 ) {
		fprintf( stderr, "Setup /dev/dsp failed.\n" );
		close( fd );
		return 1;
	}


	/* �����Ѥ������ȥǡ������� */
	for ( i = 0; i < BUFSIZE / sizeof(short); i ++ ) {
		t = ( total / (BUFSIZE / sizeof(short)) ) * i;
		if (silence == 1)
			buf[i] = 0;
		else
			buf[i] = SHRT_MAX * sin( 2.0 * 3.14159 * freq * t );
	}
    

	while (1)
	if ( write( fd, buf, BUFSIZE ) == -1 ) {
		perror( "write()" );
		close( fd );
		return 1;
	}

	close( fd );
	return 0;
}


/*
 * /dev/dsp ��ʲ����ͤ����ꤹ�롣
 *
 * �̻Ҳ��ӥåȿ�     : 16   bits
 * ����ץ�󥰼��ȿ� : 44.1 KHz
 * �����ͥ��       : 1
 * PCM �ǡ���������դ�����ȥ륨��ǥ�����
 *
 */
static int
setup_dsp( int fd, int be )
{
	int fmt     = AFMT_S16_LE;
	int freq    = 48000;
	int channel = 1;

	/* ������ɥե����ޥåȤ����� */
	if ( be )
		fmt = AFMT_S16_BE;

	if ( ioctl( fd, SOUND_PCM_SETFMT, &fmt ) == -1 ) {
		perror( "ioctl( SOUND_PCM_SETFMT )" );
		return -1;
	}

	/* �����ͥ�������� */
	if ( ioctl( fd, SOUND_PCM_WRITE_CHANNELS, &channel ) == -1 ) {
		perror( "iotcl( SOUND_PCM_WRITE_CHANNELS )" );
		return -1;
	}

	/* ����ץ�󥰼��ȿ������� */
	if ( ioctl( fd, SOUND_PCM_WRITE_RATE, &freq ) == -1 ) {
		perror( "iotcl( SOUND_PCM_WRITE_RATE )" );
		return -1;
	}

	return 0;
}

/* End of sound.c */

