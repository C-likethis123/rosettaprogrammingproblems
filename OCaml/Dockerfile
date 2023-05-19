FROM ocaml/opam:alpine

WORKDIR ocaml

# Install dependencies
ADD package.opam .
RUN opam pin add -yn ocaml . && \
    opam depxt ocaml && \
    opam install --deps-only ocaml

# Builds app
ADD . .
RUN sudo chown -R opam:nogroup . && \
    opam config exec make build