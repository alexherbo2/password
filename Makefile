build:
	shards build --release

install: build
	mkdir -p ~/.local/bin
	ln -sf "${PWD}/bin/password-create" "${PWD}/bin/password-get" "${PWD}/bin/password-menu" "${PWD}/bin/password-edit" ~/.local/bin

uninstall:
	rm -f ~/.local/bin/password-create ~/.local/bin/password-get ~/.local/bin/password-menu ~/.local/bin/password-edit

clean:
	rm -Rf bin
