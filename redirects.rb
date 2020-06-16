# Redirect all production http traffic to https
r301 %r{.*}, 'https://docs.pivotal.io$&', :if => Proc.new { |rack_env|
  rack_env['SERVER_NAME'] == 'docs.pivotal.io' && rack_env['HTTP_X_FORWARDED_PROTO'] == 'http'
}

# NOTE: Redirect to the latest version now lives in redirects.rb file inside docs-book-pcfservices

# Redirect from old configuration topic to new combined installing and configuring topic
r301 %r{/addon-fim/([\d-]+)/configuration.html}, "/addon-fim/$1/installing.html"
