default['openssl']['version'] = '1.1'
default['openssl']['prefix'] = '/usr/local'

default['selfsigned_certificate']['sslpassphrase'] = 'foo'
default['selfsigned_certificate']['country'] = 'US'
default['selfsigned_certificate']['state'] = 'TX'
default['selfsigned_certificate']['city'] = 'Austin'
default['selfsigned_certificate']['orga'] = ''
default['selfsigned_certificate']['depart'] = 'eng'
default['selfsigned_certificate']['cn'] = 'local'
default['selfsigned_certificate']['email'] = 'mike@desertrat.io'
default['selfsigned_certificate']['destination'] = '/etc/apache2/ssl/'


default['apache2']['log_dir'] = '/var/log/apache2'

default['fronds']['packages'] = %w[locate vim git]
default['fronds']['server_name'] = node['fronds']['site_folder'] + '.local'

default['fronds']['db']['version'] = '5.7'
default['fronds']['db']['name'] = 'fronds'
default['fronds']['db']['test_name'] = 'fronds_test'
default['fronds']['db']['initial_root'] = 'rootroot'

default['fronds']['php']['version'] = '7.2'
default['fronds']['php']['xdebug_conf'] = '/etc/php/7.2/mods-available/xdebug.ini'

# computed
# accounting for rubocop line length
cert_dest = node['selfsigned_certificate']['destination']
cert_name = "#{node['fronds']['server_name']}.crt"
default['fronds']['ssl']['crt'] = cert_dest + cert_name
key_dest = node['selfsigned_certificate']['destination']
key_name = "#{node['fronds']['server_name']}.key"
default['fronds']['ssl']['key'] = key_dest + key_name