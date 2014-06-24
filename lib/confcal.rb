# Work around a bug in activesupport-3.2.16/lib/active_support/time_with_zone.rb 
# it need that module for 1.hours to work
require 'active_support/core_ext/numeric/time'

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

      # FIXME: Sort talks also

      events = events.each do |year_label, year|

        sorted_events[year_label] = year.sort_by do |conf_label, conf|
          talk_times = [ conf.start ]

          if conf.talks
            conf.talks.each do |talk|
              talk_time = Chronic::parse talk.start
              talk_times.push talk_time.to_date if talk_time
            end
          end

          # If no date in conf or talks: sort to bottom by faking far future
          talk_times.compact.min || "3000-1-1".to_date
        end

      end

      sorted_events
    end

    # Filter events to only include today + future events (and cache it)
    def current_events events = data.events, time_start = Time.now, time_end = Time.now + 60*60*24*365
      if defined?(@cur_ev) && @cur_ev[time_start] && @cur_ev[time_start][time_end]
        return @cur_ev[time_start][time_end]
      end

      @cur_ev ||= {}
      @cur_ev[time_start] ||= {}

      @cur_ev[time_start][time_end] = events.each_with_object({}) do |(year_label, year), h|
        unless year_label[/schema/]

          h[year_label] = year.select do |conf_label, conf|
            matches = false

            if conf.start
              conf_date = Chronic::parse(conf.end || conf.start)
              matches = true if conf_date >= time_start && conf_date < time_end
            end

            if conf.talks and not matches
              conf.talks.each do |talk|
                talk_date = Chronic::parse(talk.end)
                if talk.end && talk_date >= time_start && talk_date < time_end
                  matches = true
                end
              end
            end

            matches
          end
        end

      end

      @cur_ev[time_start][time_end].reject! {|year_label, year| year.empty?}

      @cur_ev[time_start][time_end] = sort_events @cur_ev[time_start][time_end]

      current_events events, time_start, time_end
    end

  end
end

::Middleman::Extensions.register(:confcal, ConfCal)
