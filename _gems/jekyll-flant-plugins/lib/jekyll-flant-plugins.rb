require_relative "jekyll-flant-plugins/snippetcut"


Liquid::Template.register_tag('snippetcut', JekyllFlantPlugins::SnippetCut::SnippetCutTag)
