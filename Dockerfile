FROM pandoc/latex:latest-ubuntu

WORKDIR /

RUN apt update && apt -y install python3
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1

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