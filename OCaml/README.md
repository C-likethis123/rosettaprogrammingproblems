# Installation instructions

Install opam: `brew install opam && brew install bubblewrap`

Initialise opam: `opam init`

Check switch version: `opam switch`

Install the right compiler:
```bash
opam switch create 4.13.1
eval $(opam env)
```

## Installing libraries

`opam install core core_bench utop`

An `.ocamlinit` file has been created.

## Plugins

For VS Code, use the OCaml Platform plugin.
Install the language server protocol server: `opam install ocaml-lsp-server`