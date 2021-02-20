define HELP_MESSAGE
help:		Print this message
container:	Build container using containerfile and buildah
endef
export HELP_MESSAGE

GO_PACKAGE := github.com/ybkimm/wiki
EDITOR_OUT := public/editor.wasm
BINARY_OUT := dist/giok

.PHONY: help
help:
	@echo "$$HELP_MESSAGE"

.PHONY: container
container: ${EDITOR_OUT} ${CONTAINER_FILE} go.sum $(shell find . -name '*.go')
	$(eval VERSION := $(shell ./scripts/new-version.py))
	buildah bud -f ${CONTAINER_FILE} -t "${IMAGE_REPOSITORY}:${VERSION}"

build: ${BINARY_OUT}

run: ${EDITOR_OUT}
	@go run .

${EDITOR_OUT}: $(shell find ./editor -name '*.go' -type f)
	GOROOT=/usr/local/go115 tinygo build -o "$@" -target wasm "${GO_PACKAGE}/editor"

${BINARY_OUT}: ${EDITOR_OUT}
	go build -o "$@" -tags production "${GO_PACKAGE}"
