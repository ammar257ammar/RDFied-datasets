## Nano toxicity RDFied datasets

This repository contains datasets published as supplementary materials for nano toxicity related literature.

In each dataset folder, a folder names "rdf" contains the output RDF generated from the RML mapping.

## Other formats

The redland `rapper` tool can be used to convert the output to Turtle, e.g.:

```shell
rapper -i ntriples -o turtle mo-cytotoxicity-metadata.nq > mo-cytotoxicity-metadata.ttl
```

### Validation

The RDF structure can be compared to [this write](https://github.com/nanocommons/enmrdf)
up (structure under development in NanoCommons). Second,
[these SPARQL queries](https://github.com/NanoSolveIT/10.1021-acsnano.8b07562/tree/master/Create-RDF-Groovy/ambit)
can be used to see how AMBIT extracts information from the data to load into an
eNanoMapper instance.
