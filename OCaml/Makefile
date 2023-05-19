build:
	jbuilder build @install

doc:
	jbuilder build @doc

run: build
	jbuilder exec ocaml

test:
	jbuilder runtest

pin:opam pin add .

repin: 
	build
	opam upgrade ocaml
build-all:
	jbuilder build --workspace jbuild-workspace.dev @install
test-all:
	jbuilder build --workspace jbuild-workspace.dev @runtest
	
.PHONY: build test pin repin build-all test-all