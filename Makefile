build:
	shards build --release

install: build
	mkdir -p ~/.local/bin
	ln -sf "${PWD}/bin/password-make" "${PWD}/bin/password-get" "${PWD}/bin/password-menu" "${PWD}/bin/password-edit" ~/.local/bin

uninstall:
	rm -f ~/.local/bin/password-make ~/.local/bin/password-get ~/.local/bin/password-menu ~/.local/bin/password-edit

clean:
	rm -Rf bin
