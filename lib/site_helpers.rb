# Various useful functions for Middleman-based sites
class SiteHelpers < Middleman::Extension
  def initialize(app, options_hash = {}, &block)
    super
  end

  helpers do

    def pretty_date(sometime, length = 'long')
      return if sometime.blank?

      sometime = Time.parse(sometime) if sometime.class == String

      format = length == 'short' ? '%a %e %b' : '%A %e %B'
      format << ' %Y' unless sometime.year == Time.now.year

      sometime.to_time.strftime(format) rescue ''
    end

    def word_unwrap(content)
      content.to_s
        .gsub(/\n\n/, '!ಠ_ಠ!')
        .gsub(/\n/, ' ')
        .squeeze(' ')
        .gsub(/!ಠ_ಠ!/, "\n\n")
    end

    def html_to_plaintext(content)
      Nokogiri::HTML(content).text.strip
    end

    def markdown_to_html(content)
      return unless content

      Tilt['markdown'].new(config[:markdown]) { content.strip }.render
    end

    def markdown_to_plaintext(content)
      word_unwrap html_to_plaintext(markdown_to_html(content))
    end

  end
end

::Middleman::Extensions.register(:site_helpers, SiteHelpers)
