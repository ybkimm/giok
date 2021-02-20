# 기억

Giok(기억; The memory in Korean) is an open-source software for your all-in-one workspace.

This project is inspired by [Notion](https://www.notion.so/).

# Build

For debugging, you can run it with the 'make run' command.

## Prerequisites

* Go 1.16
* Tinygo 0.16 (This don't support Go 1.16 yet, so we need to install Go 1.15.)
* Buildah (When you want to build as a container)

## Container

### Production

```
make container
```

### Development

```
make container-dev
```

## Binary (Production)

```
make build
```
