local parseYaml = std.native("parseYaml");
local m = importstr 'data://helmApiResources';
[
  parseYaml(m)
]
