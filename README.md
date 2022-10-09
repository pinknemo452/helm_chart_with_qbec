# Helm chart via qbec
>Disclaimer: this project was developed and established during the [IT_ONE DevOps CHAMPION](https://it-onedevopschampion.ru/) 
## Purpose
The purpose of this project is to have the ability to deploy helm chart with diffirent values to various environments. Project uses qbec, k8s and helm.
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
