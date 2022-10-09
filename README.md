# Helm chart via qbec
## Purpose

## Setting

**First**, you need to change external variable helmTemplate in `spec.vars.external` in [`qbec.yaml`](qbec.yaml) file to your helm chart (it can be path or link), also change environments
**Then**, you need to change [`environments/default.libsonnet`](environments/default.libsonnet)
>This is jsonnet code example
```jsonnet
base {
    components +: {
        default: {
            replicaCount: 1
        },
        prod1: {
            command: ["prod1", "command"]
        },
        prod2: {
            replicaCount: 5
        },
        prod3: {
            replicaCount: 6
        },
    },
}
```

`components.default` is a default values for every environment and gets overrided by tagged values\
`components.exampletag` will set values for deployments with tag exampletag

## Usage
To deploy a component you can use 
```console
qbec apply your-environment --app-tag some-tag-with-values-from-default.libsonnet
```
