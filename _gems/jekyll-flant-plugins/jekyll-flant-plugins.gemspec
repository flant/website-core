require_relative "lib/jekyll-flant-plugins/version"

Gem::Specification.new do |spec|
  spec.name = "jekyll-flant-plugins"
  spec.version = JekyllFlantPlugins::VERSION
  spec.authors = ["Artem Kladov"]
  spec.email = ["artem.kladov@flant.com"]

  spec.summary = "The Jekyll Plugins for using on the Flant Europe (flant.com) sites"
  spec.homepage = "https://github.com/flant/website-core"
  spec.license = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.7.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  spec.files = Dir["lib/**/*.rb"]
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "jekyll", ">= 4.0", "< 5.0"
  spec.add_runtime_dependency "liquid", "~> 4.0"
end
