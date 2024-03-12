default:
	docker build -t content_builder .
	docker run -it -v dockIR)/work:/work content_builder