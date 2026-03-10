FROM pandoc/latex:3.9.0-alpine

WORKDIR /

RUN apk add --no-cache python3

RUN tlmgr update --self skipcache && \
    tlmgr install \
      academicons \
      arydshln \
      etextools \
      fontawesome5 \
      ifmtarg \
      latexmk \
      moderncv \
      multirow \
      texliveonfly \
      xpatch \
      xstring \
      babel-czech \
      hyphen-czech \
      ec
