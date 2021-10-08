#! /bin/bash
CUR_DIR=$(pwd)
# echo $CUR_DIR
export  LD_LIBRARY_PATH=$CUR_DIR/lib:LD_LIBRARY_PATH
 
if [ $# -eq 1 ] 
then
    port=$1   
else
    port=8090
fi
echo  using port: $port
./build/certification_client 127.0.0.1 $port
