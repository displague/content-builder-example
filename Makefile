spec_url := https://api.equinix.com/metal/v1/api-docs

default:
	docker build -t content_builder .
	docker run --rm -e SPEC_URL=$(spec_url) -it -v $(CURDIR):/work content_builder