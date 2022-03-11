---
title: Flant Jeyll theme demo page
permalink: /
---

### Benefits

{% include blocks/benefits.liquid data=site.data.benefits.benefits_group1 %}

### Code snippets

```shell
make love --no-war
```

{% snippetcut selector="example1" name="example-file.yml"  %}
```yaml
apiVersion: deckhouse.io/v1
kind: InitConfiguration
deckhouse:
  releaseChannel: Stable
  bundle: Minimal
  configOverrides:
    global:
      modules:
        publicDomainTemplate: "%s.example.com"
        placement:
          customTolerationKeys:
          - SystemLoad
    certManagerEnabled: true
    deckhouseWebEnabled: true
```
{% endsnippetcut %}
