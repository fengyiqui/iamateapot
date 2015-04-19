#include "../errhandle/errwrappedfunc.h"
#include "../wrappedfunc/wrappedfunc.h"
const int MAXLINE = 512;
const int LISTENQ = 1024;
int main(int argc, char** argv)
{
	int i,maxi,maxfd,listenfd,connfd,sockfd;
	int nready, client[FD_SETSIZE];
	ssize_t n;
	fd_set rset,allset;
	char buf[MAXLINE];
	socklen_t clilen;
	struct sockaddr_in cliaddr, servaddr;
	
	listenfd = Socket(AF_INET,SOCK_STREAM,0);

	bzero(&servaddr,sizeof(servaddr));
	servaddr.sin_family = AF_INET;
	servaddr.sin_addr.s_addr = htonl(INADDR_ANY);
	servaddr.sin_port = htons(9999);

	Bind(listenfd,(struct sockaddr*)&servaddr,sizeof(servaddr));
	Listen(listenfd,LISTENQ);
	maxfd = listenfd;
	maxi = -1;
	for(i = 0; i< FD_SETSIZE;++i)
		client[i] = -1;
	FD_ZERO(&allset);
	FD_SET(listenfd,&allset);

	for(; ; )
	{
		rset = allset;
		nready = Select(maxfd+1,&rset,NULL,NULL,NULL);
		if(FD_ISSET(listenfd,&rset) )
		{
			clilen = sizeof(cliaddr);	
			connfd = Accept(listenfd,(struct sockaddr*)&cliaddr, &clilen);
//#ifdef NOTDEF
			printf("new client: %s, port %d\n",Getpeerip(&cliaddr),Getpeerport(&cliaddr));
//#endif //NOTDEF
			
			for(i = 0; i  < FD_SETSIZE; ++i)
			{
				if(client[i] < 0)
				{
					client[i] = connfd;
					break;
				}
			}//EOF of for
			if( i == FD_SETSIZE)
				err_exit("too many clients");
			FD_SET(connfd,&allset);
			int a = 2; 
			int b = 3;
			a = (a < b)?b:a;
			maxfd = (maxfd < connfd) ? connfd : maxfd;	
			maxi  = (maxi < i) ? i : maxi;
			if( --nready <= 0)
				continue; /* no more ready descriptors,just for more efficient*/

		}
		for(i = 0; i <= maxi; i++)
		{
			if( (sockfd = client[i]) < 0)
				continue;
			if(FD_SET(sockfd,&rset) )
			{
				if( (n = Read(sockfd,buf,sizeof(buf)) ) == 0) /*using Readn is still ok*/
				{
					Close(sockfd);
					FD_CLR(sockfd,&allset);
					client[i] = -1;
				}
				else
				{
					Writen(sockfd,buf,n);
				}
				if( --nready <= 0)
					break;
			}
		}//EOF of for client
	}//EOF of for ; ;

	return 0;
}
