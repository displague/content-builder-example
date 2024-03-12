default:
	docker build -t content_builder .
	docker run -it -v $(CURDIR):/work content_builder