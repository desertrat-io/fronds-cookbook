apt_update

apache2_install 'fronds' do
  docroot_dir node['fronds']['vm_doc_root']
  apache_group node['fronds']['perm_group']
end


apache2_module 'ssl'
apache2_module 'rewrite'
apache2_module 'vhost_alias'
apache2_module 'php7' do
  mod_name "libphp#{node['fronds']['php']['version']}.so"
end
apache2_module 'mpm_event' do
  action :disable
end
apache2_module 'mpm_prefork' do
  action :enable
end

# create output dir
directory node['selfsigned_certificate']['destination'] do
  mode 0o755
  recursive true
end

openssl_x509_certificate node['fronds']['ssl']['crt'] do
  key_file node['fronds']['ssl']['key']
  city node['selfsigned_certificate']['city']
  common_name node['selfsigned_certificate']['cn']
  country node['selfsigned_certificate']['country']
  email node['selfsigned_certificate']['email']
  org node['selfsigned_certificate']['org']
  org_unit node['selfsigned_certificate']['depart']
  state node['selfsigned_certificate']['state']
end


template 'fronds' do
  extend Apache2::Cookbook::Helpers
  path "#{apache_dir}/sites-available/fronds.conf"
  source 'fronds.conf.erb'
  action :create_if_missing
end

service 'apache2' do
  extend Apache2::Cookbook::Helpers
  service_name lazy { apache_platform_service_name }
  supports restart: true, status: true, reload: true
  action :nothing
end
apache2_site 'fronds'

apache2_site '000-default' do
  action :disable
end