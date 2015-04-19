#ifndef __ERR_WRAPPED_FUNC_H__
#define __ERR_WRAPPED_FUNC_H__
#include	<string.h>
#include	<errno.h>
#include	<stdarg.h>
#include        <stdio.h>
#include        <stdlib.h>
// if set daemon_proc non-zero log will be logged by syslog
//Nonfatal error related to system call
void err_ret(const char* cszFmt,...);
//Fatal error related to system call
void err_sys(const char* cszFmt, ...);
//Fatal error related to system call,call abort then exit
void err_dump(const char* cszFmt,...);
//Fatal error unrelated to system call
void err_exit(const char* cszFmt, ...);
//Nonfatal error unrelated to system call
void err_msg(const char* cszFmt, ...);
#endif //__ERR_WRAPPED_FUNC_H__
