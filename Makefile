.PHONY: docs-check task-agent-catalog-check

MINT_VERSION ?= 4.2.687

task-agent-catalog-check:
	python3 scripts/check-task-agent-catalog.py

docs-check: task-agent-catalog-check
	npx --yes mint@$(MINT_VERSION) validate
	npx --yes mint@$(MINT_VERSION) broken-links --check-anchors --check-redirects --check-snippets
