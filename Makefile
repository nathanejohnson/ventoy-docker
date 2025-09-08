.PHONY: build clean version

version = 1.1.07

tarball = ventoy-$(version)-linux.tar.gz

build: ventoy Dockerfile
	@docker build -t ventoy:latest -t ventoy:$(version) .

$(tarball):
	curl -L https://github.com/ventoy/Ventoy/releases/download/v$(version)/$(tarball) > $(tarball)


ventoy: $(tarball)
	rm -rf ventoy
	tar xzf $(tarball)
	mv ventoy-$(version)/ ventoy/
	touch ventoy
	find ventoy/tool/aarch64 -name '*.xz' -exec  unxz {} \;
	find ventoy/tool/aarch64 -type f -exec chmod +x {} \;
	find ventoy/tool/x86_64 -name '*.xz' -exec  unxz {} \;
	find ventoy/tool/x86_64 -type f -exec chmod +x {} \;

clean:
	@rm -f *.tar.gz
	@rm -rf ventoy*

version:
	@echo VENTOY_VERSION=$(version)
