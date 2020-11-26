## Nano toxicity RDFied datasets

This repository contains datasets published as supplementary materials for nano toxicity related literature.

In each dataset folder, a folder names "rdf" contains the output RDF generated from the RML mapping.

## Other formats

The redland `rapper` tool can be used to convert the output to Turtle, e.g.:

```shell
rapper -i ntriples -o turtle mo-cytotoxicity-metadata.nq > mo-cytotoxicity-metadata.ttl
```
