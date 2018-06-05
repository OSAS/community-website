###
# Site settings
###

# Look in data/site.yml for general site configuration


Time.zone = data.site.timezone || "UTC"

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Syntax highlighting
activate :syntax

# Make URLs relative
set :relative_links, true

# Set HAML to render HTML5 by default (when unspecified)
# It's important HAML outputs "ugly" HTML to not mess with code blocks
set :haml, :format => :html5, :ugly => true

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

set :asciidoc_attributes, %w(source-highlighter=coderay imagesdir=images)

set :asciidoctor,
  :toc => true,
  :numbered => true


# Set directories
set :css_dir, 'stylesheets'
set :fonts_dir, 'stylesheets/fonts'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :partials_dir, 'layouts'


###
# Blog settings
###

activate :blog do |blog|
  blog.publish_future_dated = true

  blog.prefix = "blog/"
  blog.layout = "post"
  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"
  blog.default_extension = ".md"

  blog.sources = ":year-:month-:day-:title.html"
  #blog.permalink = ":year/:month/:day/:title.html"
  blog.permalink = ":year/:month/:title.html"
  blog.year_link = ":year.html"
  blog.month_link = ":year/:month.html"

  blog.taglink = "tag/:tag.html"

  #blog.summary_separator = /(READMORE)/
  #blog.summary_length = 99999

  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page=:num"

  # Day archives are overrated (and not used) - part 1/2
  blog.day_link = "IGNORE.html" #":year/:month/:day.html"
end

# Day archives are overrated (and not used) - part 2/2
ignore "/blog/IGNORE.html"

#activate :authors
#activate :drafts

# Enable blog layout for all blog pages
with_layout :post do
  page "/blog.html"
  page "/blog/*"
end

# Make pretty URLs
activate :directory_indexes

activate :piwik do |f|
    f.id = 3
    f.domain = 'tracker.osci.io'
    f.url = 'piwik'
end


###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end


###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Don't have a layout for XML
page "*.xml", :layout => false

# Docs all have the docs layout
with_layout :docs do
  #page "/documentation/*"
  #page "/documentation*"
end

# Don't make these URLs have pretty URLs
page "/404.html", :directory_index => false
page "/.htacces.html", :directory_index => false

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

proxy "/.htaccess", "/.htaccess.html", :locals => {}, :ignore => true

proxy "/centos-faq/index.html", "/centos/faq.html", :ignore => true
ignore "/centos/faq-document.html"

ready do
  # Add yearly calendar pages
  data.events.each do |year, data|
    next unless year.match(/[0-9]{4}/)
    proxy "/events/#{year}.html", "events/index.html", locals: {year: year}
  end

  # Add author pages
  sitemap.resources.group_by {|p| p.data["author"]}.each do |author, pages|
    proxy "/blog/author/#{author.parameterize}.html", "author.html", locals: {author: author, pages: pages}, :ignore => true if author
  end
  proxy "/blog/author.html", "author.html", :ignore => true

  # Add blog feeds
  blog.tags.keys.map(&:parameterize).uniq.compact.each do |tag_name|
    proxy "/blog/tag/#{tag_name}.xml", "feed.xml", locals: {tag_name: tag_name}, :ignore => true if tag_name
  end
  proxy "/blog/feed.xml", "feed.xml", :ignore => true
  proxy "/blog/tag/index.html", "tag.html", :ignore => true
end


###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end
#helpers do
#end

require 'lib/site_helpers.rb'
activate :site_helpers

require 'lib/blog_helpers.rb'
activate :blog_helpers

require 'lib/confcal.rb'
activate :confcal

require 'lib/brandguide.rb'
activate :brandguide

require 'lib/monkeypatch_blog_date.rb'


###
# Monkeypatch blog 'published?' to support an environtmental variable to
# publish every blog post — even drafts!
#
# This is especially useful when building for a preview server.
#
# Enable by setting the environtmental variable PUBLISH_DRAFTS=true
# Example: PUBLISH_DRAFTS=true ./run-server.sh build
###

module Middleman::Blog::BlogArticle
  alias_method :_published?, :published?

  def published?
    return true if ENV['PUBLISH_DRAFTS']

    _published?
  end
end


###
# Development-only configuration
###
#
configure :development do
  puts "\nUpdating git submodules..."
  puts `git submodule init && git submodule sync`
  puts `git submodule foreach "git pull -qf origin master"`
  `git commit -q -m "updated events" data/events &>/dev/null`
  puts "\n"
  puts "== Administration is at http://0.0.0.0:4567/admin/"

  activate :livereload
  #config.sass_options = {:debug_info => true}
  #config.sass_options = {:line_comments => true}
  compass_config do |config|
    config.output_style = :expanded
    config.sass_options = {:debug_info => true, :line_comments => true}
  end
end

# Build-specific configuration
configure :build do
  puts "\nUpdating git submodules..."
  puts `git submodule init`
  puts `git submodule foreach "git pull -qf origin master"`
  puts "\n"

  ## Ignore administration UI
  ignore "/admin/*"
  ignore "/javascripts/admin*"
  ignore "/stylesheets/lib/admin*"

  ## Ignore Gimp source files
  ignore 'images/*.xcf*'

  # Don't export source JS
  ignore 'javascripts/vendor/*'
  ignore 'javascripts/lib/*'

  # Don't export source CSS
  ignore 'stylesheets/vendor/*'
  ignore 'stylesheets/lib/*'

  ignore 'events-yaml*'

  # Minify JavaScript and CSS on build
  activate :minify_javascript
  activate :minify_css
  #activate :gzip

  # Force a browser reload for new content by using
  # asset_hash or cache buster (but not both)
  activate :cache_buster
  # activate :asset_hash

  # Use relative URLs for all assets
  #activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"

  # Favicon PNG should be 144×144 and in source/images/favicon_base.png
  # Note: You need ImageMagick installed for favicon_maker to work
  activate :favicon_maker do |f|
    f.template_dir  = File.join(root, 'source','images')
    f.output_dir    = File.join(root, 'build','images')
    f.icons = {
        "favicon_base.png" => [
                { icon: "favicon.png", size: "16x16" },
                { icon: "favicon.ico", size: "64x64,32x32,24x24,16x16" },
        ]
    }
  end
end

