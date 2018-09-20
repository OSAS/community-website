# If you have OpenSSL installed, we recommend updating
# the following line to use "https"
source 'https://rubygems.org'

gem "middleman", "~> 3.3.3"

# In order to get SASS 3.3, compass 1.0 is needed
# FIXME: Remove this once 1.0 is final (very, very soon now -- next week?)
gem 'compass', '~> 1.0.0.alpha.21'

# Cross-templating language block fix for Ruby 1.8
platforms :mri_18 do
  gem "ruby18_source_location"
end


#####
# General plugins

# Blog plugin
gem "middleman-blog"

# HTML & XML parsing smarts
gem "nokogiri", "~> 1.6.0"


#####
# Formats

# Markdown
# pinned to fix issue with https://github.com/gettalong/kramdown/pull/513
# and https://github.com/redhat-openstack/website/pull/1218
gem "kramdown", "~> 1.16.0"

gem 'chronic'
gem 'icalendar', '~> 1.5'

