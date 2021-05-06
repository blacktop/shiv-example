SITEP = $(PWD)/venv/lib/python3.9/site-packages
INTP = '/usr/bin/env python3'
PROTO = $(PWD)/proto/test.proto

.PHONEY: run
run: build ## Run the exe
	dist/myapp

.PHONEY: build
build: clean venv ## Build python exe
	mkdir -p dist
	# . venv/bin/activate; python setup.py install
	# . venv/bin/activate; cd pyrobuf $(PROTO) --install --package myapp_proto --out-dir $(SITEP)/myapp_proto
	# mv myapp_proto.egg-info $(SITEP)
	. venv/bin/activate; shiv --compressed -p $(INTP) -o dist/myapp -e myapp.__main__:main . shiv
	ls -lah dist

.PHONEY: venv
venv: ## Build virtual environment
	python3 -m venv venv
	. venv/bin/activate; pip3 install shiv pyrobuf

clean: ## Clean up artifacts
	$(RM) -rf build dist venv myapp.egg-info pyrobuf
	$(RM) -rf ~/.shiv

# Absolutely awesome: http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help