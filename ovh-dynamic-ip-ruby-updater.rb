#!/usr/bin/env ruby
require 'uri'
require 'net/http'

ovhid     = 'your_nic_given_by_ovh'
pass      = 'your_ovh_password'
dyndomain = 'your_domain_to_update'

#get the ip
uri = URI('https://ident.me')
res = Net::HTTP.get_response(uri)
ip  = res.body if res.is_a?(Net::HTTPSuccess)

#update ovh 
req_ovh = 'https://#{ovhid}:#{pass}@www.ovh.com/nic/update?system=dyndns&hostname=#{dyndomain}&myip=#{ip}'
uri_ovh = URI(req_ovh)
res_ovh = Net::HTTP.get_response(uri_ovh)
puts res_ovh.body if res_ovh.is_a?(Net::HTTPSuccess)
