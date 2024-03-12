spec_url := https://api.equinix.com/metal/v1/api-docs

.PHONY: build default debug

default: build
	docker run --rm  -it -v $(CURDIR):/work content_builder

build:
	docker build -t content_builder --build-arg SPEC_URL=$(spec_url) .

debug: build
	@echo -e "\n\nWhen ready, run: cd /work; ansible-playbook build.yaml -e manifest_file=MANIFEST.yaml\n"
	@docker run --rm --workdir=/work -e SPEC_URL=$(spec_url) -it -v $(CURDIR):/work -t content_builder bash