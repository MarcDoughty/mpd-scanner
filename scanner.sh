#!/bin/bash

DATESTAMP=(`date -u +%F-%H:%M`)

if [ "$SCANTYPE" = "sslscan" ]
	then
		sslscan \
		--show-certificate \
		--targets=/mount/mpd-scanner/targets.txt \
		--xml=/mount/mpd-scanner/output/$SCANTYPE-$DATESTAMP.xml
	fi

if [ "$SCANTYPE" = "portscan" ]
	then
		nmap -v -Pn -r -R -sT -sV -O -A -p 1-48000 \
		-iL /mount/mpd-scanner/targets.txt \
		-oX /mount/mpd-scanner/output/$SCANTYPE-$DATESTAMP.xml
	fi

if [ "$SCANTYPE" = "quickscan" ]
	then
		nmap -v -Pn -r -R -sT -sV -O -A \
		-iL /mount/mpd-scanner/targets.txt \
		-oX /mount/mpd-scanner/output/$SCANTYPE-$DATESTAMP.xml
	fi

if [ "$SCANTYPE" = "hardcore" ]
	then
		nmap -v -Pn -r -R -sT -sV -O -A -p 1-48000 \
		-iL /mount/mpd-scanner/targets.txt \
		-oX /mount/mpd-scanner/output/$SCANTYPE-$DATESTAMP.xml \
		--script http-methods,\
		http-php-version,\
		ms-sql-info,\
		mysql-info,\
		oracle-tns-version,\
		rpcinfo,\
		smb2-capabilities,\
		ssl-cert,\
		ssl-enum-ciphers
	fi
exit
