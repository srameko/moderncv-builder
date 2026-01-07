FROM pandoc/latex:latest-alpine

WORKDIR /

RUN apk add --no-cache python3

RUN tlmgr update --self skipcache
RUN tlmgr install \
 academicons \
 arydshln \
 etextools \
 fontawesome5 \
 ifmtarg \
 latexmk \
 moderncv \
 multirow \
 texliveonfly\
 xpatch \
 xstring \
 babel-czech \
 hyphen-czech \
 ec 
