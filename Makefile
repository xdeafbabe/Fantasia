.DEFAULT: help
.PHONY: help bootstrap lint test

help:
	@echo "Please use '$(MAKE) <target>' where <target> is one of the following:"
	@echo "  help        - show help information"
	@echo "  bootstrap   - install project dependencies"
	@echo "  lint        - inspect project source code for errors"
	@echo "  test        - run project tests"

bootstrap:
	pdm install -d

lint:
	pdm run flake8 --config=flake8.ini src tests
	pdm run mypy src tests

test:
	pdm run pytest --cov-report=term-missing
