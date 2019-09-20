#include <stdio.h>
#include <stdlib.h>

#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <netinet/in.h>
#include <unistd.h>
#include <string.h>

int my_strlen(char *string)
{
    int i;
    for(i=0;string[i]!='\0';i++);
    return i;
}

int main (int argc, char *argv[]){
	
	if(argc < 6){
		fprintf(stderr, "%s", "Incorrect number of arguments!\n");
		return -1;
	}
	
	if( my_strlen(argv[5]) < 2 ){
		fprintf(stderr, "%s", "Empty print request!\n");
		return -1;
	}
		
	char order[28];
	memset(order,0,sizeof(order));
	for(int i = 1; i < strlen(argv[5]); i++){
		
		if( argv[5][i] == 'N'){
			strcat(order,"3");
		}
		else if( argv[5][i] == 'S'){
			strcat(order,"2");
		}
		else if( argv[5][i] == 'L'){
			strcat(order,"1");
		}
		else if( argv[5][i] == 'F'){
			strcat(order,"4");
		}	
	}
	strcat(order," ");
	int count = 1;
	char countc[8];	
	for(int i = 7; i < argc ; i++){
		
		if(argv[i-1][1] == 'l'){
			strcat(order,argv[i]);
			strcat(order,",");
			strcat(order," ");
		}
		else if(argv[i-1][1] == 'n'){
			strcat(order,argv[i]);
			strcat(order,",");
			strcat(order," ");
		}
		else if(argv[i-1][1] == 's'){
			strcat(order,argv[i]);
			strcat(order,",");
			strcat(order," ");
		}
		else if(argv[i-1][1] == 'f'){
			strcat(order,argv[i]);
			strcat(order," ");
		}
		i++; count++;
	}
		
	sprintf(countc, "%d", count);
	strcat(order,countc);	
	int ntw_socket;   
	
	if ( (ntw_socket = socket(AF_INET,SOCK_STREAM,0) ) < 0) { 
    		fprintf(stderr, "%s", "Error on Socket!\n");
			return -1;
	}
	struct sockaddr_in server_address; struct hostent *hptr;
	server_address.sin_family = AF_INET;
	server_address.sin_port =htons(atoi(argv[4]));
	if ( (hptr =  gethostbyname(argv[2]) ) == NULL){
    		fprintf(stderr, "gethostname error: %s", argv[2]);
    		return -1;
   	}
 	memcpy( &server_address.sin_addr, hptr->h_addr, hptr->h_length);
	

	int connection_status =	connect(ntw_socket, (struct sockaddr *) &server_address, sizeof(server_address));
	
	if (connection_status == -1){
	
		fprintf(stderr, "%s", "Error on Connetcion!\n");
			return -1;	
	}
	
	if( write(ntw_socket, order, strlen(order) +1) < 0 ){
		
		fprintf(stderr, "%s", "Error on Write!\n");
		return -1;
	}
	
	char server_response[16384];
	if ( read(ntw_socket, server_response, sizeof(server_response) ) < 0) {  
      			fprintf(stderr, "%s", "Error on Read!\n");
			return -1;
    		}
	
	printf("%s\n",server_response);

	close(ntw_socket);

	return 0;
}

