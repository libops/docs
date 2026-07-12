.PHONY: docs-check

MINT_VERSION ?= 4.2.687

docs-check:
	npx --yes mint@$(MINT_VERSION) validate
	npx --yes mint@$(MINT_VERSION) broken-links --check-anchors --check-redirects --check-snippets
