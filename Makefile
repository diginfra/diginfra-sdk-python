

.PHONY: test
test:
	poetry run mamba -f documentation

.coverage:
	poetry run coverage run $(shell poetry run which mamba) -f documentation || true

cover: .coverage
	poetry run coverage report --include 'dicclient/*'

.PHONY: cover-html
cover-html: .coverage
	poetry run coverage html -d coverage --include 'dicclient/*'
