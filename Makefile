default:
	docker build -t content_builder .
	docker run --rm -it -v $(CURDIR):/work content_builder