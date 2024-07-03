#!/bin/sh
google_domains() {
supported_domains=$(curl -q https://www.google.com/supported_domains)
for i in $supported_domains
do
 d=${i#.}
 google=$google"$d IN CNAME forcesafesearch.google.com.\n"
 google=$google"www.$d IN CNAME forcesafesearch.google.com.\n"
done
for i in www.youtube.com m.youtube.com youtubei.googleapis.com \
youtube.googleapis.com www.youtube-nocookie.com 
do
 google=$google"$i IN CNAME restrict.youtube.com.\n"
done
printf "$google"
}
cat << EOF
\$TTL 128
;
\$ORIGIN forcesafesearch.
@               IN  SOA localhost.        root.localhost. (
                2474766874 ; serial
                1d ; refresh
                2h ; retry
                4w ; expire
                1h ; default_ttl
                )
		NS localhost.
; Zone Records
; force google safesearch
$(google_domains)
; force bing strict
bing.com IN CNAME strict.bing.com.
www.bing.com IN CNAME strict.bing.com.
; force duckduckgo safe search
duckduckgo.com IN CNAME safe.duckduckgo.com.
EOF
