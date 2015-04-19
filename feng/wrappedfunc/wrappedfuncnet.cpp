#include "wrappedfunc.h"
#include <unistd.h>
int Socket(int family, int type, int protocol)
{
	int n = 0;
	if( (n = socket(family,type,protocol)) < 0 )
		err_sys("socket error");
	return n;
}

void Connect(int fd, const struct sockaddr* sa, socklen_t socklen)
{
	if(connect(fd,sa,socklen) < 0)
		err_sys("connect error");
}
void Bind(int fd, const struct sockaddr* sa, socklen_t addrlen)
{
	if(bind(fd,sa,addrlen) < 0)
		err_sys("bind error");
}
//can be set when process is running by env FENG_LISTENq
void Listen(int fd, int backlog)
{
	char* ptr = NULL;
	if( (ptr = getenv("FENG_LISTENQ")  )!= NULL)
		backlog = atoi(ptr);
	if(listen(fd,backlog) < 0)
		err_sys("listen error");
}
//@return the next completed connection
int Accept(int fd, struct sockaddr* sa, socklen_t *salenptr)
{
	int n = 0;
again:
	if( (n = accept(fd,sa,salenptr) ) < 0)
	{
#ifdef EPROTO
		if(errno == EPROTO || errno == ECONNABORTED)
#else
		if(errno == ECONNABORTED)
#endif
			goto again;
		else
			err_sys("accept error");
	}
	return n;
}
void Close(int fd)
{
	if( close(fd) == -1)
		err_sys("close error");
}
void Shutdown(int fd, int how)
{
	if(shutdown(fd,how) < 0)
		err_sys("shutdown error");
}
void Getpeername(int fd, struct sockaddr *sa, socklen_t *salenptr)
{
	if( getpeername(fd,sa,salenptr) < 0 )
		err_sys("getsockname error");
}
//@return may return null
const char* Getpeerip(const void * ptrsa)
{
	const struct sockaddr* sa = (const struct sockaddr*)ptrsa;
	static char ip[INET6_ADDRSTRLEN]; /* max len of ip addr */
	const char* ptr = inet_ntop(sa->sa_family,sa,ip,INET6_ADDRSTRLEN);
	if(errno == ENOSPC)
		err_sys("Getperrip err,not enouth space");
	return ptr;
}
//@return zero if failed
unsigned short Getpeerport(const void* ptrsa)
{
	const struct sockaddr* sa = (const struct sockaddr*)ptrsa;
	if(sa->sa_family == AF_INET)
	{
		const struct sockaddr_in* ptr4 = (const sockaddr_in*)(sa);
		return ntohs(ptr4->sin_port);
	}
	else if(sa->sa_family == AF_INET6)
	{
		const struct sockaddr_in6* ptr6 = (const sockaddr_in6*)(sa);
		return ntohs(ptr6->sin6_port);
	}
	else
	{
		err_sys("Getport not support protocol!!!");
		return 0;
	}
}
void Getsockname(int fd, struct sockaddr* sa, socklen_t* salenptr)
{
	if(getsockname(fd,sa,salenptr) < 0)
		err_sys("getsockname error");
}
const char* Inet_ntop(int family, const void* addrptr, char* strptr, size_t len)
{
	const char* ptr;
	if(strptr == NULL)
		err_exit("NULL 3rd argument to inet_ntop");
	if( (ptr = inet_ntop(family,addrptr,strptr,len)) == NULL)
		err_sys("inet_ntop error");
	return ptr;
}
void Inet_pton(int family, const char* strptr, void* addrptr)
{
	int n = 0;
	if( (n = inet_pton(family,strptr,addrptr)) < 0)
		err_sys("inet_pton error for %s",strptr);
	else if(n == 0)
		err_exit("inet_pton error for %s",strptr);
}
int Select(int nfds, fd_set* readfds, fd_set* writefds, fd_set* exceptfds, struct timeval* timeout)
{
	int n = 0;
	if( (n = select(nfds, readfds, writefds, exceptfds,timeout)) < 0)
		err_sys("select error");
	return n;
}

