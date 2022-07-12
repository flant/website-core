---
title: Flant Jeyll theme Демо 
permalink: /ru/
lang: ru
---

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

{% snippetcut selector="example2" name="1.js" url="#" %}
```javascript
function Log() {
    console.log(12345);
}
```
{% endsnippetcut %}
