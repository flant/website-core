require "liquid"

module JekyllFlantPlugins
  module SnippetCut
    class SnippetCutTag < Liquid::Block
      @@DEFAULTS = {
          :name => 'changeme.yaml',
          :url => '/changeme.yaml',
          :limited => false
      }

      def self.DEFAULTS
        return @@DEFAULTS
      end

      def initialize(tag_name, raw_markup, tokens)
        super
        @raw_markup = raw_markup
        @config = {}
      end

      def render(context)
        @markup = Liquid::Template
          .parse(@raw_markup)
          .render(context)
          .gsub(%r!\\\{\\\{|\\\{\\%!, '\{\{' => "{{", '\{\%' => "{%")
          .strip

        site = context.registers[:site]
        lang = context.registers[:page]['lang']

        override_config(@@DEFAULTS)

        params = @markup.scan /([a-z]+)\=\"(.+?)\"/
        if params.size > 0
          config = {}
          params.each do |param|
            config[param[0].to_sym] = param[1]
          end
          override_config(config)
        end

        content = super
        rendered_content = Jekyll::Converters::Markdown::KramdownParser.new(Jekyll.configuration()).convert(content)

        %Q(
<div class="snippetcut#{@config[:limited] ? ' snippetcut_limited' : ''}" data-snippetcut>
<div class="snippetcut__title">#{if (@config[:url]!='#') then "<a href=\""+@config[:url]+"\" target=\"_blank\" class=\"snippetcut__title-name\" data-snippetcut-name>" else "<span class=\"snippetcut__title-name-text\" data-snippetcut-name>" end}#{@config[:name]}#{if (@config[:url]!='#') then "</a>" else "</span>" end}
<a href="javascript:void(0)" class="snippetcut__title-btn" data-snippetcut-btn-name>#{ site.data.dig('i18n', 'copy_filename', lang) ? site.data['i18n']['copy_filename'][lang] : site.data['global']['i18n']['copy_filename'][lang].capitalize }</a>
<a href="javascript:void(0)" class="snippetcut__title-btn" data-snippetcut-btn-text>#{ site.data.dig('i18n', 'copy_content', lang) ? site.data['i18n']['copy_content'][lang] : site.data['global']['i18n']['copy_content'][lang].capitalize }</a>
</div>
<div class="highlight">
#{rendered_content}
</div>
<div class="snippetcut__raw" data-snippetcut-text>#{CGI::escapeHTML(remove_excessive_newlines(content.strip.gsub(%r!^```[a-zA-Z0-9]*!,'')))}</div>
</div>
        )
      end

      private

      def override_config(config)
        config.each{ |key,value| @config[key] = value }
      end

      def remove_excessive_newlines(text)
        return text.sub(/^(\s*\R)*/, "").rstrip()
      end
    end
  end
end
