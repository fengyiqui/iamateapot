#ifndef __WRAPPED_FUNC_H__
#define __WRAPPED_FUNC_H__
#include	"commonnetheaders.h"
#include	"../errhandle/errwrappedfunc.h"
//TODO:根据不同的功能还可拆分
//net
int Socket(int family, int type, int protcol);
void Connect(int fd, const struct sockaddr* sa, socklen_t socklen);
void Bind(int fd, const struct sockaddr* sa, socklen_t arrdlen);

//can be set when process is running by env FENG_LISTENq
void Listen(int fd, int backlog);
//@return the next completed connection
int Accept(int fd, struct sockaddr* sa, socklen_t *salenptr);
void Close(int fd);
void Shutdown(int fd, int how);
void Getpeername(int fd, struct sockaddr *sa, socklen_t *salenptr);
//@return may return null
const char* Getpeerip(const void  *sa);
//@return zero if failed
unsigned short Getpeerport(const void* sa);
void Getsockname(int fd, struct sockaddr* sa, socklen_t* salenptr);
const char* Inet_ntop(int family, const void* addrptr, char* strptr, size_t len);
void Inet_pton(int family, const char* strptr, void* addrptr);
int Select(int nfds,
		fd_set* readfds,
		fd_set* writefds,
		fd_set* exceptfds,
		struct timeval* timeout);
void Write (int fd, void* ptr, size_t nbytes);
void Writen(int fd, void* ptr, size_t nbytes);
ssize_t Read (int fd, void* ptr, size_t nbytes);
ssize_t Readn(int fd, void* ptr, size_t nbytes);	

//
#ifndef HAVE_BZERO
#define bzero(ptr,n) memset(ptr,0,n)
#endif

//io
void Fclose(FILE* fp);
FILE* Fdopen(int fd, const char* type);
char* Fgets(char* ptr, int n, FILE* stream);
FILE* Fopen(const char* filename, const char* mode);
void Fputs(const char* ptr, FILE* stream);
#endif //__WRAPPED_FUNC_H__
