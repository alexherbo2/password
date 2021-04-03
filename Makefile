build:
	shards build --release

install: build
	install -d ~/.local/bin
	install bin/password ~/.local/bin

uninstall:
	rm -f ~/.local/bin/password

clean:
	rm -Rf bin
