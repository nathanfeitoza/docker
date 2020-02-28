cd /mnt/ebe9676a-3cfc-4333-9d60-8066d6f275ad/backups/docker
 sudo docker ps --format '{{.ID}}\t{{.Names}}' | awk '{
 print "Backup do container "$1" ("$2")";
 system("date");
 system("docker commit -p "$1" backup-"$2);
 system("docker save -o backup-"$2".tar backup-"$2);
 system("docker rmi backup-"$2) ;
 print "";
 }';
 date;