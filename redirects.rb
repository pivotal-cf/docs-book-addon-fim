# Redirect all production http traffic to https
r301 %r{.*}, 'https://docs.pivotal.io$&', :if => Proc.new { |rack_env|
  rack_env['SERVER_NAME'] == 'docs.pivotal.io' && rack_env['HTTP_X_FORWARDED_PROTO'] == 'http'
}

r301 %r{/addon-fim/2-1/(.*)}, "https://docs.vmware.com/en/File-Integrity-Monitoring-for-VMware-Tanzu/2.1/fim/GUID-index.html"

