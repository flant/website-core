---
title: Flant Jekyll theme demo page
permalink: /
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


<div class="trdl-configuration-table">
    <table aria-hidden=true>
        {{ "tableLineCounter" | reset_shared_counter }}
        {% for directive in site.data.test.directives %}
        {% include configuration_table_directive.html directive=directive %}
        {% endfor %}
    </table>
</div>
