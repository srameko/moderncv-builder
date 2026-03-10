# CLAUDE.md

## Project overview

Docker image builder for converting moderncv LaTeX documents to PDF.
Published to Docker Hub as `srameko/moderncv-builder`.

## Key facts

- Base image: `pandoc/latex:3.6.3-alpine` — update version here and in README together
- `WORKDIR /` is intentional — do NOT change it, the image is used in another repo that depends on this mount path
- Docker Hub secret is named `DOCKER_PASSWORD` (it's actually an access token, just named that way)

## CI/CD

- `docker-publish.yml` — builds and pushes on push to main; uses `docker/build-push-action` with GHA cache
- `trivy.yml` — CVE scan on push/PR + weekly schedule (Monday 06:30 UTC); results in GitHub Security tab
- `dependabot.yml` — weekly PRs for github-actions and docker base image updates

## GitHub Actions conventions

- All actions pinned to commit SHA with version comment, e.g. `actions/checkout@<sha> # v4.2.2`
- Dependabot keeps SHAs updated automatically

## Adding new TeX Live packages

Add to the `tlmgr install` block in `Dockerfile`. Keep packages alphabetically sorted.
