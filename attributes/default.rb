default['openssl']['version'] = '1.1'
default['openssl']['prefix'] = '/usr/local'

default['selfsigned_certificate']['sslpassphrase'] = 'foo'
default['selfsigned_certificate']['country'] = 'US'
default['selfsigned_certificate']['state'] = 'TX'
default['selfsigned_certificate']['city'] = 'Austin'
default['selfsigned_certificate']['orga'] = ''
default['selfsigned_certificate']['depart'] = 'eng'
default['selfsigned_certificate']['cn'] = 'local'
default['selfsigned_certificate']['email'] = 'mlawson1986@gmail.com'
default['selfsigned_certificate']['destination'] = '/etc/apache2/ssl'

default['apache']['mpm'] = 'prefork'
default['apache']['log_dir'] = '/var/log/apache2'

default['fronds']['packages'] = %w[locate vim git]
default['fronds']['server_name'] = node['fronds']['site_folder'] + '.local'

default['fronds']['db']['version'] = '5.7'
default['fronds']['db']['name'] = 'fronds'
default['fronds']['db']['test_name'] = 'fronds_test'
default['fronds']['db']['initial_root'] = 'rootroot'

default['fronds']['php']['xdebug_conf'] = '/etc/php/7.2/mods-available/xdebug.ini'