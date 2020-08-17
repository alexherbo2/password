build:
	shards build --release

install: build
	mkdir -p ~/.local/bin
	ln -sf "${PWD}/bin/password" ~/.local/bin

uninstall:
	rm -f ~/.local/bin/password

clean:
	rm -Rf bin
