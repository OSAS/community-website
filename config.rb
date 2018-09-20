###
# Site settings
###

# Look in data/site.yml for general site configuration


Time.zone = data.site.timezone || "UTC"

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Make URLs relative
set :relative_links, true

# Set Markdown features for Kramdown
# (So our version of Markdown resembles GitHub's w/ other nice stuff)
set :markdown,
  transliterated_header_ids: true,
  parse_block_html: true,
  parse_span_html: true,
  tables: true,
  hard_wrap: false,
  input: 'GFM' # add in some GitHub-flavor (``` for fenced code blocks)

set :markdown_engine, :kramdown


# Set directories
set :css_dir, 'stylesheets'
set :fonts_dir, 'stylesheets/fonts'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :partials_dir, 'layouts'


# Make pretty URLs
activate :directory_indexes

###
# Page options, layouts, aliases and proxies
###

# Don't have a layout for XML
page "*.xml", :layout => false


ready do
  # Add yearly calendar pages
  data.events.each do |year, data|
    next unless year.match(/[0-9]{4}/)
    proxy "/events/#{year}.html", "events/index.html", locals: {year: year}
  end
end


###
# Helpers
###

require 'lib/site_helpers.rb'
activate :site_helpers

require 'lib/confcal.rb'
activate :confcal


# Build-specific configuration
configure :build do
  puts "\nUpdating git submodules..."
  puts `git submodule init`
  puts `git submodule foreach "git pull -qf origin master"`
  puts "\n"

  ignore 'events-yaml*'
end

