# CLAUDE.md

## Project overview

Docker image builder for converting moderncv LaTeX documents to PDF.
Published to Docker Hub as `srameko/moderncv-builder`.

## Key facts

- Base image: `pandoc/latex:3.9.0-alpine` — update version here and in README together
- `WORKDIR /` is intentional — do NOT change it, the image is used in another repo that depends on this mount path
- Docker Hub secret is named `DOCKER_PASSWORD` (it's actually an access token, just named that way)

## CI/CD

- `docker-publish.yml` — builds and pushes on push to main; uses `docker/build-push-action` with GHA cache; requires `docker/setup-buildx-action` for GHA cache to work
- `trivy.yml` — CVE scan on push/PR + weekly schedule (Monday 06:30 UTC); results in GitHub Security tab; does a fresh docker build (no cache); fails only on CRITICAL/HIGH with a fix available (`--ignore-unfixed`, `exit-code=1`); when it fails, check Dependabot PRs for a base image update
- `dependabot.yml` — weekly PRs for github-actions and docker base image updates

## GitHub Actions conventions

- All actions pinned to commit SHA with version comment, e.g. `actions/checkout@<sha> # v4.2.2`
- Dependabot keeps SHAs updated automatically

## tlmgr

- Always use `--verify-repo=none` on both `tlmgr update` and `tlmgr install`
- Reason: pandoc/latex alpine images use frozen TL repo (tlnet-final) where FTP has no signature files

## Adding new TeX Live packages

Add to the `tlmgr install` block in `Dockerfile`. Keep packages alphabetically sorted.

## Local testing

```bash
# Build
docker build -t moderncv-builder:local .

# Test — mount your .tex project into /
docker run --rm -v $(pwd):/  moderncv-builder:local latexmk -pdf cv.tex
```

## .dockerignore

`.git`, `.github`, `.devcontainer`, `*.md` are excluded from build context.
Do NOT add `Dockerfile` to `.dockerignore`.
