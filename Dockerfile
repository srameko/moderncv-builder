FROM pandoc/latex:latest-alpine

WORKDIR /

RUN apk --no-cache add python

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
