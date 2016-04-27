class BrandGuide < Middleman::Extension
  def initialize(app, options_hash = {}, &block)
    super
  end

  helpers do
    # Calculate if the text should be on dark or light background
    # Converts RGB to YIQ for better color comparisons
    # More on YIQ: https://en.wikipedia.org/wiki/YIQ
    #
    # Returns true if light color, false if dark color
    def color_contrast(hex)
      # Remove '#', to get at hex number
      h = hex.tr('#', '')

      # Expand hex triples (example: #ac9 as #aacc99)
      h = h.chars.map { |c| c + c }.join if h.size == 3

      # Convert each R G B component from hex to decimal
      r = h[0..1].to_i(16)
      g = h[2..3].to_i(16)
      b = h[4..5].to_i(16)

      # Compare YIQ conversion to midpoint (256 / 2 = 128)
      (r * 299 + g * 587 + b * 114) / 1000 >= 128
    end

    # Output HTML for the color table
    def format_color_table(colors)
      capture_haml do
        haml_tag :table, class: 'table color-table' do
          haml_tag :tr, {} do
            color_width = (100 / colors.count).floor
            colors.each do |color|
              next if color[:hex].nil?

              lightdark = color_contrast color[:hex]
              csscolor = "background:#{color[:hex]};" \
                         "color:##{lightdark ? '000' : 'fff'};"

              tag_opts = { style: csscolor,
                           class: "brand-color-#{color[:name].parameterize}",
                           width: "#{color_width}%" }

              haml_tag :td, tag_opts do
                haml_tag :strong, color[:name]
                haml_tag :ul do
                  haml_tag :li, "Hex: #{color[:hex]}"
                  haml_tag :li, "RGB: #{color[:rgb]}" if color[:rgb]
                  haml_tag :li, "CMYK: #{color[:cmyk]}" if color[:cmyk]
                  haml_tag :li, "Pantone #{color[:pantone]}" if color[:pantone]
                end
              end
            end
          end
        end
      end
    end

    # Parse color table data and produce HTML table output
    def color_table(*obj)
      colors = obj.map do |vals|
        attr = {}
        vals = vals.strip.split("\n").map do |val|
          val.gsub(/RGB|HEX|CMYK|Pantone/i, '').strip
        end

        attr[:name] = vals.shift

        vals.each do |val|
          next if val.empty?
          case val
          when /#[0-9a-fA-F]{3,6}/ then attr[:hex] = val
          when /(\d+\D+){3}\d+/ then attr[:cmyk] = val
          when /(\d+\D+){2}\d+/ then attr[:rgb] = val
          else attr[:pantone] = val
          end
        end

        attr
      end

      format_color_table colors
    end
  end
end

::Middleman::Extensions.register(:brandguide, BrandGuide)
