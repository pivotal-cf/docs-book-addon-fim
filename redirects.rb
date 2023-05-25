# Redirect all production http traffic to https
r301 %r{.*}, 'https://docs.pivotal.io$&', :if => Proc.new { |rack_env|
  rack_env['SERVER_NAME'] == 'docs.pivotal.io' && rack_env['HTTP_X_FORWARDED_PROTO'] == 'http'
}

# Redirect from docs.pivotal.io/addon-fim/2-0/ to docs.vmware.com FIM PDF

r301  %r{/addon-fim/1-2}, "https://docs.vmware.com/en/File-Integrity-Monitoring-for-VMware-Tanzu/1.2/fim-for-vmware-tanzu-1-2.pdf"
