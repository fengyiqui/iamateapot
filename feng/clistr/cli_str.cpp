#include "cli_str.h"
#include<algorithm>
const int MAXLINE = 1024;

void str_cli(FILE* fp, int sockfd)
{
	int maxfdpl, stdineof;
	fd_set rset;
	char buff[MAXLINE];
	int n;
	stdineof = 0;
	FD_ZERO(&rset);
	for( ; ;)
	{
		if(stdineof == 0)
			FD_SET(fileno(fp),&rset);
		FD_SET(sockfd,&rset);
		maxfdpl = std::max(fileno(fp), sockfd);
		Select(maxfdpl+1,&rset,NULL,NULL,NULL);
		if(FD_ISSET(sockfd,&rset))
		{
				
			if( (n = Read(sockfd,buff,sizeof(buff)) ) == 0)
			{
				if(stdineof == 1)
					return;
				else
					err_exit("str_cli server terminated permaturely");
			}
			
			Write(fileno(stdout),buff,n);
		}
		if(FD_ISSET(fileno(fp),&rset) )
		{
			if( (n = Read(fileno(fp),buff,sizeof(buff)) ) == 0 )
			{
				stdineof = 1;
				Shutdown(sockfd, SHUT_WR);
				FD_CLR(sockfd,&rset);
				continue;
			}
			Writen(sockfd, buff, n);
		}

	}//EOF of for ;;
}
