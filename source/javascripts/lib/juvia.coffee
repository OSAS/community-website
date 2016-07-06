juvia_options = 
  container: '#blog-comments'
  site_key: '3uxgji3zhp1x1rwnfuyvx7t2d0zwlh1'
  topic_key: location.pathname.match(/(\/[^\/]*)\/?$/)[1]
  topic_url: location.href
  topic_title: document.title or location.href
  include_base: !window.Juvia
  include_css: false
  comment_order: 'latest-first'

makeQueryString = (options) ->
  key = undefined
  params = []
  for key of options
    `key = key`
    params.push encodeURIComponent(key) + '=' + encodeURIComponent(options[key])
  params.join '&'

makeApiUrl = (options) ->
  # Makes sure that each call generates a unique URL, otherwise
  # the browser may not actually perform the request.
  if !('_juviaRequestCounter' of window)
    window._juviaRequestCounter = 0
  result = '//comment-osasteam.rhcloud.com/api/show_topic.js' + '?_c=' + window._juviaRequestCounter + '&' + makeQueryString(options)
  window._juviaRequestCounter++
  result

if document.getElementById('blog-comments')
  s = document.createElement('script')
  s.async = true
  s.type = 'text/javascript'
  s.className = 'juvia'
  s.src = makeApiUrl(juvia_options)
  (document.getElementsByTagName('head')[0] or document.getElementsByTagName('body')[0]).appendChild s
return
