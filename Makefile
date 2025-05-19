.PHONY: build

version = 1.1.05

tarball = ventoy-$(version)-linux.tar.gz

build: ventoy Dockerfile
	docker build -t ventoy .

$(tarball):
	curl -L https://github.com/ventoy/Ventoy/releases/download/v$(version)/ventoy-$(version)-linux.tar.gz


ventoy: $(tarball)
	rm -rf ventoy
	tar xzf $(tarball)
	mv ventoy-$(version)/ ventoy/
	find ventoy/tool/$$(uname -i) -name '*.xz' -exec  unxz {} \;
	find ventoy/tool/$$(uname -i) -type f -exec chmod +x {} \;


