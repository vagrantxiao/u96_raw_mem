

m=$(shell date)

all:
	@echo "Hello"

git:
	git add .
	git commit -m "$(m)"
	git push origin main
