class ConfCal < Middleman::Extension
  def initialize(app, options_hash={}, &block)
    require 'chronic'
    require 'nokogiri'
    require 'date'

    super
  end

  helpers do

    def markdown content
      Tilt['markdown'].new { content.strip }.render if content
    end

    def word_unwrap content
      content.to_s.gsub(/\n\n/, '!ಠ_ಠ!').gsub(/\n/, ' ').squeeze(' ').gsub(/!ಠ_ಠ!/, "\n\n")
    end

    def tz_lookup time_zone
      return @tzc[time_zone] || time_zone if defined? @tzc

      ## Build timezone abbriviation dictionary
      @tzc ||= {}

      # Prioritize US & Indian timezones
      (ActiveSupport::TimeZone.us_zones + [ActiveSupport::TimeZone.new('Asia/Kolkata')] + ActiveSupport::TimeZone.all).each do | zone|
        daylight_abbr = zone.parse('Aug 1').strftime('%Z')
        standard_abbr = zone.parse('Dec 1').strftime('%Z')

        # It's important to give priority to "standard" time,
        # as there are some clashes
        # (Sadly, that's just the way it is)
        @tzc[standard_abbr] = zone.name unless @tzc[standard_abbr]
        @tzc[daylight_abbr] = zone.name unless @tzc[daylight_abbr]
      end

      tz_lookup time_zone
    end

    def strftime_zone time_string, time_zone = "UTC", time_fmt
      old_zone = Time.zone rescue "UTC"
      Time.zone = tz_lookup time_zone rescue "UTC"

      #result = time_string.to_time.getlocal.strftime(time_fmt)
      result = Time.zone.parse(time_string).strftime(time_fmt)

      Time.zone = old_zone

      result
    end

    def vcal_time time_string, time_zone = "UTC"
      old_zone = Time.zone rescue "UTC"
      Time.zone = tz_lookup time_zone rescue "UTC"
      Chronic.time_class = Time.zone

      result = Chronic::parse(time_string).utc.strftime('%Y%m%dT%H%M%SZ')

      Time.zone = old_zone

      result
    end

  end
end

::Middleman::Extensions.register(:confcal, ConfCal)
