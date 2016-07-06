# Our default Juvia options
juvia_options = 
  container: '#blog-comments'
  site_key: '3uxgji3zhp1x1rwnfuyvx7t2d0zwlh1'
  topic_key: location.pathname.match(/(\/[^\/]*)\/?$/)[1]
  topic_url: location.href
  topic_title: document.title or location.href
  include_base: !window.Juvia
  include_css: false
  comment_order: 'latest-first'

# Generate a Juvia API, complete with request counters
makeApiUrl = (options) ->
  # Makes sure that each call generates a unique URL, otherwise
  # the browser may not actually perform the request.
  window._juviaRequestCounter ||= 0
  window._juviaRequestCounter++

  options['_c'] = window._juviaRequestCounter - 1

  '//comment-osasteam.rhcloud.com/api/show_topic.js?' + $.param(options)

# Siple wrapper to use jQuery to inject the script with the proper API
run_juvia = (options = juvia_options) ->
  $.getScript makeApiUrl(options)

# Load data from Juvia in a hacky way and display comment count on the
# website
show_comment_count = (article) ->
  $article = $(article)
  path = $article.find('.post-title a').attr('href')

  # Set up custom options for the Juvia server
  # that make our fake "Juvia" happy
  options =
    site_key: juvia_options.site_key
    topic_key: '/' + path.match('([^\/]*)/?$')[1]
    topic_url: window.location.origin + path
    topic_title: $article.find('.post-title a').text()
    include_css: false
    include_base: false
    container: '#' + $article.attr('id') + ' .more-link'

  # Backup old Juvia
  window.Juvia_backup = window.Juvia if window.Juvia and window.Juvia.findContainer

  # Make a fake "Juvia" object with our custom handler as its only function
  window.Juvia = handleResponse: (data) ->
    # Find the first header, which lists the number of comments
    comments = $(data.html).find('h3').first().text()

    # Add a a comment to the link if there are comments
    $(data.container).prepend(comments + ' / ') if comments != 'Add comment'

    # Restore previous Juvia
    window.Juvia = window.Juvia_backup if window.Juvia_backup

  run_juvia(options)

# on jQuery(ready)
$ ->
  # Run our fake Juvia replacement on every article on article listing pages
  # (front page, blog page, etc.)
  $('.articles article').each (i, article) -> show_comment_count(article)

  # Run Juvia for article pages (that have a '#blog-comments' section)
  if $('#blog-comments').length
    run_juvia().done ->
      # Replace dates immediately after the Juvia script is run
      $('.juvia-creation-date').each (i, dateObj) ->
        $date = $(dateObj)
        timeObj = moment $date.text().trim(), 'MMMM DD YYYY hh:mm'
        timeString = timeObj.format('D MMM YYYY')
        timeAgo = timeObj.fromNow()

        $newDate = $('<time class="juvia-creation-date">')
          .attr('datetime', timeObj.toISOString())
          .attr('title', timeObj.format('dddd, MMMM Do YYYY @ hh:mm'))
          .html("#{timeAgo} &mdash; <span>#{timeString}</span>")

        $date.replaceWith($newDate)
