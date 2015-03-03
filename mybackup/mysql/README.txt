1. °²×°crontab
30 1 * * *  /home/username/mybackup/shell/logman_export.sh /home/username/mybackup/data/logman/logman.sql 2>&1 >> /home/username/mybackup/log/logman.log
30 3 * * *  /home/username/mybackup/shell/deloverdate_sql.sh /home/username/mybackup/data/ 2>&1 >> /home/username/mybackup/log/deloverdate_sql.log
2. 