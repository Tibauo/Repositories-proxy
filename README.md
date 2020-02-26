Create repo proxy for Debian and CentOS

On the server with a root user
make IP=<192.168.2.100>

for regular update : make update

for clean : make clean (kill only container)

for all clean : make cleanall

how does it work :
=> Create folder in the hosts /repos
=> Create container with command to download all packages
=> Start container with volumes 
=> Create container with nginx
=> Start nginx container
