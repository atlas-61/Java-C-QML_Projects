#include <stdio.h>
#include <stdlib.h>

#include <sys/types.h>
#include <sys/socket.h>

#include <netinet/in.h>
#include <unistd.h>
#include <string.h>

int my_strlen(char *string)
{
    int i;
    for(i=0;string[i]!='\0';i++);
    return i;
}

const char * order (char rows[128], char *tokens[]){
	const char * result; 
	char *delims, * string[5],  charry[4096], ch;
	memset(charry, 0, sizeof(charry));
	int m = 0, n = 0, max = 0;
	delims = strtok(rows,",\n");
	while(delims != NULL){
		string[m] = delims;
		delims = strtok (NULL, ",\n");
		m++;
	}
	max = my_strlen(tokens[0]);
	for(m = 0; m < max; m++){		
		ch = tokens[0][m];
		n = ch - '0';		
		strcat(charry, string[n]);
		if( m != max -1)		
			strcat(charry, ", ");
	}
	result = charry;
	return result;	
}

const char *database (int length, char *tokens[]){

	FILE* db = fopen("database.csv", "r");
	int flag = 1, m = 0, n, k;
    	char rows[128], buffer[16384];
	const char * result, * serried;
    	while (fgets(rows, 1024, db))
    	{	
		
		for(int i=1; i < length; i++){
			
			flag = 1;
			if(!strstr(rows,tokens[i])){
				i = length;
				flag = 0;
			}
		}
      		if (flag == 1){
			serried = order(rows,tokens);
			//printf("%s\n", serried);
			strcat(buffer, serried);
			strcat(buffer,"\n");
		}	
    	}
	
	fclose(db);
	result = buffer;
	return result;	
		
}

int main(int argc, char *argv[]){
	
	if (argc < 3){
		fprintf(stderr, "%s", "Argument is missing! (-p #portnumber)\n");
		return -1;
  	}
	
	int server_socket;
	if((server_socket = socket(AF_INET, SOCK_STREAM, 0)) < 0){
		fprintf(stderr, "%s", "Error on Socket!\n");
		return -1;
	}

	struct sockaddr_in server_address;
	server_address.sin_family = AF_INET;
	server_address.sin_port =htons(atoi(argv[2]));
	server_address.sin_addr.s_addr = INADDR_ANY;

	if(bind(server_socket, (struct sockaddr*) &server_address, sizeof(server_address)) < 0){
		fprintf(stderr, "%s", "Error on Bind!\n");
		return -1;
	}
	if(listen(server_socket, 5)){
		fprintf(stderr, "%s", "Error on Listen!\n");
		return -1;
	}

	int client_socket;
	char  msg[1024];
	char *packet[512], *delim;
	int m=0;
	if((client_socket = accept(server_socket, NULL, NULL)) < 0){
		fprintf(stderr, "%s", "Error on Accept!\n");
		return -1;
	}
		
	bzero(msg,sizeof(msg));	
	if ( read(client_socket, msg, sizeof(msg) ) < 0) {  
      		fprintf(stderr, "%s", "Error on Read!\n");
		return -1;
    	}

	int i = 0, test=2;
	char pch;
	while(msg[i] != '\0')
    		i++;
       
    	pch = msg[i-1];
	test = pch - '0';

	delim = strtok(msg," ");
	while(delim != NULL){
		packet[m] = delim;
		delim = strtok (NULL, " ");
		m++;
	}
	
	const char *result;
	result = database(test, packet);
	if (write(client_socket, result, strlen(result) +1) < 0){
		fprintf(stderr, "%s", "Error on Read!\n");
		return -1;
	}
	
	close(client_socket);	
	close(server_socket);
	
	return 0;

}
