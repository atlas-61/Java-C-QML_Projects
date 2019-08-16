#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <unistd.h>
#include <string.h>
#include <arpa/inet.h>

int main(int argc, char *argv[]){
	
	char s_request[1024] = "GET /";
	char hostnm[512] = "\r\n Host: ";
	char *ff_request = "Accept: gif Accept-Encoding: identity, *;q=0 \r\n\r\n";
	struct hostent *hptr;
	int client_socket;
	client_socket = socket (AF_INET, SOCK_STREAM, 0);
	struct sockaddr_in remote_address;
	remote_address.sin_family = AF_INET;	
	
	FILE *dwl;
	if(strstr(argv[1], "html")){
		dwl = fopen("webpage.html","w");
	}
	else if(strstr(argv[1], "gif")){
		dwl = fopen("image.gif","w");
	}
	else{
		dwl = fopen("index.txt","w");
	}	
	
	int flag2 = 0, flag3 = 0, portnum = 80;
	int length = strlen(argv[1]);

  	if(strstr(argv[1], "cz:"))
		flag2 = 1;
	
	char *pch;
	int cntr = 0;
  	pch = strtok (argv[1],"/:");
  	while (pch != NULL)
  	{
		if(cntr >= 2){
			if(flag2 == 1){
				portnum = atoi(pch);
				flag2= 0; 
			}
			else{
				strcat(s_request,pch);
				strcat(s_request,"/"); 
				flag3 = 1;
			}
		}
		if(cntr == 0)
			if(pch == "http"){
			}
				
			else{
				hptr =  gethostbyname(argv[1]);
				strcat(hostnm,argv[1]);
			}
		if(cntr == 1)
			hptr =  gethostbyname(pch);
		;
		cntr++;
		pch = strtok (NULL, "/:");
  	}
	
	if(flag3 == 1){	
		
    		int i = 0;
    		while(s_request[i] != '\0')
    		{
        		i++;
         
    		}
    		s_request[i-1] = '\0';
		strcat(hostnm,ff_request);
		strcat(s_request,hostnm);
	}	
	else{
		strcat(hostnm,ff_request);
		strcat(s_request,hostnm);
	}
	remote_address.sin_port = htons(portnum);
	memcpy( &remote_address.sin_addr, hptr->h_addr, hptr->h_length);
	
	connect(client_socket, (struct sockaddr *) &remote_address, sizeof(remote_address));
	
	char response[4096]; 
	
	send(client_socket, s_request, sizeof(s_request), 0);
	
	int total_len = 0;
    	int file_len = 99352;
	int resp_length = -1;
	 while(resp_length != 0)
    	{	
        	resp_length = recv(client_socket, &response, sizeof(response), 0); 
		
        	if( resp_length < 0 ){
            		printf("recv failed!");
            		break;
        	}

		total_len += resp_length;         		  		
		fwrite(response, resp_length, 1, dwl);
		
		memset(response,0,sizeof(response));
       	 	printf("Received byte size = %d \nTotal byte size = %d \n", resp_length, total_len);

        	if( total_len >= file_len ){
            		break;
        	}
		  
    }
	fclose(dwl);
	close(client_socket);
	return 0;
}


