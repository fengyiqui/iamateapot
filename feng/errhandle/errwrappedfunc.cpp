#include "errwrappedfunc.h"
#include <syslog.h>
#define		MAXLINE 4096 	/*512 or  1024 or 4096 */
// this return value  is useless
// if daemon vsnprintf and snpritf err info will be ignored
int daemon_proc;
static int err_do_it(int nerrflags, int nlevel, const char* cszFmt, va_list ap)
{
	int nReturn = 0;
	static char buff[MAXLINE+1];
	int nRst = vsnprintf(buff,sizeof(buff),cszFmt,ap);	
	if(nRst < 0)	
	{
		printf("%s,%d,wrong encoding!!\n",__FUNCTION__,__LINE__);
		nReturn = -1;
	}
	else if(nRst >= (int)sizeof(buff))
		printf("%s,%d,buff len is less than str so truncated\n",__FUNCTION__,__LINE__);
	if(nerrflags > 0 )
	{
		int n = strlen(buff);
		nRst = snprintf(buff+strlen(buff),MAXLINE-n," , %s",strerror(errno));
		if(nRst < 0)
		{
			printf("%s,%d,wrong encoding!",__FUNCTION__,__LINE__);
		}
	}
	strcat(buff,"\n");

	if(daemon_proc)
	{
		syslog(nlevel,buff);
	}
	else
	{
		fflush(stdout);
		fputs(buff,stderr);
		fflush(stderr);
	}
	return nReturn;
}
//Nonfatal error related to system call
void err_ret(const char* cszFmt,...)
{
	va_list ap;
	va_start(ap,cszFmt);
	err_do_it(1,LOG_INFO,cszFmt,ap);
	va_end(ap);
}
//Fatal error related to system call
void err_sys(const char* cszFmt, ...)
{
	va_list ap;
	va_start(ap,cszFmt);
	err_do_it(1,LOG_ERR,cszFmt,ap);
	va_end(ap);
	exit(1);
}
//Fatal error related to system call
void err_dump(const char* cszFmt,...)
{
	va_list ap;
	va_start(ap,cszFmt);
	err_do_it(1,LOG_ERR,cszFmt,ap);
	va_end(ap);
	abort();
	exit(1);
}
//Nonfatal error unrelated to system call
void err_msg(const char* cszFmt, ...)
{
	va_list ap;
	va_start(ap,cszFmt);
	err_do_it(0,LOG_INFO,cszFmt,ap);
	va_end(ap);
}

//Fatal error unrelated to system call
void err_exit(const char* cszFmt, ...)
{
	va_list ap;
	va_start(ap,cszFmt);
	err_do_it(0,LOG_ERR,cszFmt,ap);
	va_end(ap);
	exit(1);
}

