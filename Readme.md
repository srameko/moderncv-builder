# Modern CV Builder

[![Build and Push Docker Image](https://github.com/srameko/moderncv-builder/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/srameko/moderncv-builder/actions/workflows/docker-publish.yml)
[![Trivy Security Scan](https://github.com/srameko/moderncv-builder/actions/workflows/trivy.yml/badge.svg)](https://github.com/srameko/moderncv-builder/actions/workflows/trivy.yml)
[![Docker Pulls](https://img.shields.io/docker/pulls/srameko/moderncv-builder)](https://hub.docker.com/r/srameko/moderncv-builder)
[![Image Size](https://img.shields.io/docker/image-size/srameko/moderncv-builder/latest)](https://hub.docker.com/r/srameko/moderncv-builder)

Docker image for building [moderncv](https://ctan.org/pkg/moderncv) LaTeX documents to PDF.

## Included packages

Based on `pandoc/latex:3.6.3-alpine` with the following TeX Live packages:
`academicons`, `arydshln`, `etextools`, `fontawesome5`, `ifmtarg`, `latexmk`, `moderncv`, `multirow`, `texliveonfly`, `xpatch`, `xstring`, `babel-czech`, `hyphen-czech`, `ec`

## Usage

```bash
docker run --rm -v $(pwd):/ srameko/moderncv-builder latexmk -pdf cv.tex
```
