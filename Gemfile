# If you have OpenSSL installed, we recommend updating
# the following line to use "https"
source 'https://rubygems.org'
source 'https://rails-assets.org'

gem "middleman", "~>3.2"

# Live-reloading plugin
gem "middleman-livereload"

# Debugger / REPL alternative to irb
gem 'pry'
gem 'pry-debugger'
gem 'pry-stack_explorer'

# Cross-templating language block fix for Ruby 1.8
platforms :mri_18 do
  gem "ruby18_source_location"
end

# For faster file watcher updates for people using Windows
gem "wdm", "~> 0.1.0", :platforms => [:mswin, :mingw]


#####
# General plugins

# Blog plugin
gem "middleman-blog"
#gem "middleman-blog-drafts"
#gem "middleman-blog-authors"

gem 'middleman-deploy'

gem 'middleman-piwik'

# Thumbnailer
#gem "middleman-thumbnailer", github: "nhemsley/middleman-thumbnailer"

# favicon support (favicon PNG should be 144×144)
gem "middleman-favicon-maker"

# HTML & XML parsing smarts
gem "nokogiri"

# Syntax highlighting
gem "middleman-syntax"

# For feed.xml.builder
gem "builder", "~> 3.0"

# Better JSON lib
gem "oj"

# Lock jQuery to 1.x, for better IE support (6 - 8)
# Fixes and features are backported from 2.x to 1.x; only diff is IE support.
# see http://blog.jquery.com/2013/01/15/jquery-1-9-final-jquery-2-0-beta-migrate-final-released/
gem 'rails-assets-jquery', '~> 1'

gem 'rails-assets-fullcalendar'


#####
# Bootstrap

# Bootstrap, as SASS 3 version (there's a bug in 3.0.1+, so we're
# locking to 3.0.0 for now
gem "bootstrap-sass", "3.0.0"


#####
# Formats

# less (css)
gem "therubyracer"
gem "less"

# asciidoctor
gem "asciidoctor"

# mediawiki
gem "wikicloth"

# Markdown, with GitHub flavoring
gem "redcarpet"

gem 'open-uri-cached'
gem 'reverse_markdown'
gem 'chronic'
#gem 'geocoder'
#gem 'tzinfo'
#gem 'tzinfo-data'
#gem 'json'
#gem 'timezone'

gem 'icalendar'
