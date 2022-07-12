# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "jekyll-flant-theme"
  spec.version       = "#SEMVER"
  spec.authors       = ["Artem Kladov"]
  spec.email         = ["artem.kladov@flant.com"]

  spec.summary       = "The Jekyll Theme for using on the Flant Europe (flant.com) sites."
  spec.homepage      = "https://github.com/flant/website-core"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.2"
end
