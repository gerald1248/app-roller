# check for prerequisites
EXECUTABLES = docker jq
K := $(foreach exec,$(EXECUTABLES),\
	$(if $(shell which $(exec)),"",$(error "$(exec) not in path")))

# fetch name and namespace
NAME = $(shell jq -r .name chart/values.yaml)
NAMESPACE = $(shell jq -r .namespace chart/values.yaml)

# targets
build:
	docker build -t $(NAME) .
push:
	docker tag $(NAME) gerald1248/$(NAME):latest
	docker push gerald1248/$(NAME):latest
