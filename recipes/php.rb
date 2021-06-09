case node['platform']
when 'centos'

  yum_repository 'remi-php74' do
    action :create
  end
  yum_package 'php74'

when 'ubuntu'
  apt_repository 'ondrej-php' do
    uri 'ppa:ondrej/php'
    components %w[main stable]
  end

  apt_update

  package "php#{node['fronds']['php']['version']}"
  # will soon be replaced with a phpbrew compile to fpm
  package "libapache2-mod-php#{node['fronds']['php']['version']}"
  package "php#{node['fronds']['php']['version']}-cli"
  package "php#{node['fronds']['php']['version']}-common"
  package "php#{node['fronds']['php']['version']}-mbstring"
  package "php#{node['fronds']['php']['version']}-intl"
  package "php#{node['fronds']['php']['version']}-xml"
  package "php#{node['fronds']['php']['version']}-mysql"
  package "php#{node['fronds']['php']['version']}-zip"
  package "php#{node['fronds']['php']['version']}-xdebug"
  package "php#{node['fronds']['php']['version']}-bcmath"
  package "php#{node['fronds']['php']['version']}-curl"

else
  Chef::Log.fatal 'ERROR: Platform not supported!'
end

template node['fronds']['php']['xdebug_conf'] do
  source 'xdebug.ini.erb'
  mode '0644'
end