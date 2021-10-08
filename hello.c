#include<stdio.h>
#include<openssl/crypto.h>

int main()
{
// unsigned int sslVersion = OPENSSL_VERSION_NUMBER;
	printf("ssl version:0x%lX\n",OPENSSL_VERSION_NUMBER);
	return 0;
}