SOURCE_FILES := $(wildcard src/*/*.py) Dockerfile requirements.txt
MODEL = {{cookiecutter.image_name}}
.PHONY: build clean

build/$(MODEL).tar.gz: $(SOURCE_FILES)
	docker build -t $(MODEL):to-upload .
	docker save $(MODEL):to-upload | gzip > $@

build: build/$(MODEL).tar.gz

clean:
	rm -f build/$(MODEL).tar.gz
