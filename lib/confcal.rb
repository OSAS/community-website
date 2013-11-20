class ConfCal < Middleman::Extension
  def initialize(app, options_hash={}, &block)
    require 'chronic'
    require 'nokogiri'
    require 'date'

    super
  end

  helpers do

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

    def sort_events events = data.events
      sorted_events = {}

      events = events.each do |year_name, year|
        sorted_events[year_name] = year.sort_by do |conf_slug, conf|
          talk_times = [ conf.start ]

          if conf.talks
            conf.talks.each do |talk|
              talk_times.push Chronic::parse(talk.start) if defined? talk.start
            end
          end

          talk_times.min
        end
      end

      sorted_events
    end

    # Filter events to only include today + future events (and cache it)
    def current_events events = data.events
      return sort_events @cur_ev if defined? @cur_ev

      @cur_ev = events.each_with_object({}) do |(year_name, year), h|
        current_time = Time.now

        h[year_name] = year.select do |conf_slug, conf|
          matches = false

          if conf.start
            matches = true if Chronic::parse(conf.end || conf.start) >= current_time
          end

          if conf.talks and not matches
            conf.talks.each do |talk|
              if talk.end && Chronic::parse(talk.end) >= current_time
                matches = true
              end
            end
          end

          matches
        end
      end

      current_events
    end

  end
end

::Middleman::Extensions.register(:confcal, ConfCal)
