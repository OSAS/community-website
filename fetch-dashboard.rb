#!/usr/bin/ruby

require 'time'
require 'fileutils'
require 'net/http'
require 'uri'
require 'io/console'
require 'json'

base_dir = 'data/dashboard'

sites = [
  {
    name: 'oVirt',
    dashboard: 'http://www.ovirt.org/stats/',
    url: 'http://www.ovirt.org/stats/data/json/',
    stats: %w(irc its mls scm)
  }, {
    name: 'RDO',
    dashboard: 'https://www.rdoproject.org/stats/',
    url: 'https://www.rdoproject.org/stats/data/json/',
    stats: %w(irc its mediawiki mls qaforums scm)
  }
]

# Current terminal width, in characters, used for the progressbar
screen_width = IO.console.winsize[1]

sites.each do |site|
  site_name = site[:name]
  uri = URI.parse site[:url]
  # Set progressbar counts
  pb_total = pb_current = site[:stats].length

  # Open the HTTP(s) connection to the server.
  # If the server supports it, all of the commands will be performed on
  # one connection, saving overhead and making it all quicker.
  Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme[/s/]) do |h|
    prefix = "#{base_dir}/#{site_name.downcase}"
    prefix_exist = Dir.exist?(prefix)

    # Progressbar settings (per site)
    pb_action = prefix_exist ? 'Freshening' : 'Downloading'
    pb_str = "#{pb_action} #{site_name} dashboard data"
    pb_width = screen_width - pb_str.length - 10

    # Re-use the site config above by outputting specific metadata to files
    FileUtils.mkdir_p prefix
    File.write "#{prefix}/details.json", site.to_json

    site[:stats].each do |stat|
      # Calculate and ouput our progressbar!
      pb_current -= 1
      pb_done = (pb_total - pb_current).to_f / pb_total.to_f
      pb_bar = '#' * (pb_done * pb_width).to_i
      pb_empty = '-' * ((1 - pb_done) * pb_width).to_i
      print "\r#{pb_str}: #{(pb_done * 100).to_i}% #{pb_bar}#{pb_empty}"

      %w(static evolutionary).each do |type|
        type_short = type.slice(0, 4)
        filename = "#{prefix}/#{type_short}/#{stat}.json"
        remote_path = "#{uri.path}#{stat}-#{type}.json"

        # Skip heads if path doesn't exist
        response = prefix_exist ? h.head(remote_path) : nil

        # Only operate on found remote files
        if !response || response.code.match(/^2/)
          # mtimes may result in nil/false; it works fine for comparison below
          mtime = response && Time.parse(response.header['last-modified']).utc
          mtime_file = File.exist?(filename) && File.mtime(filename).utc

          # Download unless it's the same exact time local as remote
          unless File.exist?(filename) && mtime_file == mtime
            remote = h.get remote_path
            # Use GET for mtime if we skipped HEAD
            mtime ||= Time.parse(remote.header['last-modified']).utc

            # Ensure path exists & write file with proper date
            FileUtils.mkdir_p File.dirname(filename)
            File.write filename, remote.body
            FileUtils.touch filename, mtime: mtime
          end

        else
          code = response ? response.code : remote.code
          puts "Got a #{code} when trying to download #{uri.host}#{remote_path}"
        end
      end
    end

    puts ''
  end
end

puts ''
