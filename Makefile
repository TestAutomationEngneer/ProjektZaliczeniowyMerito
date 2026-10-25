.PHONY: help check run

PYTHON = python3

help:
	@echo "Dostepne polecenia:"
	@echo "  make check - sprawdz wersje Pythona"
	@echo "  make run   - uruchom aplikacje app.py"

check:
	$(PYTHON) --version

run:
	$(PYTHON) app.py
