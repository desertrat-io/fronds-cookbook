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

default['friends']['packages'] = %w[locate vim git]
default['friends']['server_name'] = node['friends']['site_folder'] + '.local'

default['friends']['db']['version'] = '5.7'
default['friends']['db']['name'] = 'fronds'
default['friends']['db']['test_name'] = 'fronds_test'
default['friends']['db']['initial_root'] = 'rootroot'

default['friends']['php']['xdebug_conf'] = '/etc/php/7.2/mods-available/xdebug.ini'