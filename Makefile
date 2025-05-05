VENV := .venv
PYTHON := $(VENV)/bin/python
PIP := $(VENV)/bin/pip
MKDOCS := $(VENV)/bin/mkdocs

# List of files to copy into ./docs
DOC_FILES := README.md CONTRIBUTING.md CHANGELOG.md

.PHONY: all docs clean

all: docs

$(VENV)/bin/activate: 
	python3 -m venv $(VENV)
	$(PIP) install --upgrade pip
	$(PIP) install mkdocs mkdocs-material mkdocs-material-extensions markdown-include
	touch $(VENV)/bin/activate

docs: $(VENV)/bin/activate
	mkdir -p docs
	@for file in $(DOC_FILES); do \
		if [ -f $$file ]; then \
			cp $$file docs/; \
			echo "Copied $$file to docs/"; \
		else \
			echo "Warning: $$file not found."; \
		fi \
	done
	$(MKDOCS) serve

clean:
	rm -rf $(VENV)
	@for file in $(DOC_FILES); do \
		rm -f docs/$$file; \
	done
