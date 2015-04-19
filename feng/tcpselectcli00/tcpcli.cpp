#include "../errhandle/errwrappedfunc.h"
#include "../wrappedfunc/wrappedfunc.h"
#include "../clistr/cli_str.h"
int main(int argc, char** argv)
{
	int sockfd;
	struct sockaddr_in servaddr;
	if(argc != 2)
		err_exit("usage: tcpcli <IPaddress>");
	sockfd = Socket(AF_INET,SOCK_STREAM,0);
	servaddr.sin_family = AF_INET;
	servaddr.sin_port = htons(9999);
	Inet_pton(AF_INET,argv[1],&servaddr.sin_addr);

	Connect(sockfd, (struct sockaddr*)&servaddr,sizeof(servaddr));

	str_cli(stdin,sockfd);
	return 0;
}
