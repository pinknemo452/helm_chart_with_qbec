
// this file has the param overrides for the default environment
local base = import './base.libsonnet';

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
