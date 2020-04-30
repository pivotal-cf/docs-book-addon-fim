# Redirect all production http traffic to https
r301 %r{.*}, 'https://docs.pivotal.io$&', :if => Proc.new { |rack_env|
  rack_env['SERVER_NAME'] == 'docs.pivotal.io' && rack_env['HTTP_X_FORWARDED_PROTO'] == 'http'
}

# Redirect from old configuration topic to new combined installing and configuring topic
r301 %r{/addon-fim/2-0/configuration.html}, "/addon-fim/2-0/installing.html"
