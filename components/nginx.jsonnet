local parseYaml = std.native("parseYaml");
local m = importstr 'data://helmApiResources';


local ns = std.extVar('qbec.io/defaultNs');
local parsed = parseYaml(m);
[{
    apiVersion: 'v1',
    kind: 'Namespace',
    metadata: {
        name: std.extVar('qbec.io/defaultNs'),
    },
},
  std.parseYaml(std.strReplace(m, 'namespace: "default"', 'namespace: "%s"' % ns))
]
