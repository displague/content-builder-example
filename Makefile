default:
	docker build -t content_builder .
	docker run -it -v $(CURDIR)/work:/work content_builder