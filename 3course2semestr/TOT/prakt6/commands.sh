
#Остановка в режиме fast
/usr/lib/postgresql/14/bin/pg_ctl -w -l ~/logfile -D /var/lib/postgresql/14/main restart

#Остановка в режиме immidiate
/usr/lib/postgresql/14/bin/pg_ctl -w -D /var/lib/postgresql/14/main stop -m immediate
/usr/lib/postgresql/14/bin/pg_ctl -w -l ~/logfile -D /var/lib/postgresql/14/main start