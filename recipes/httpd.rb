apt_update
apache2_install 'fronds' do
  docroot_dir node['fronds']['vm_doc_root']
  apache_group node['fronds']['perm_group']
end

service 'apache2' do
  extend Apache2::Cookbook::Helpers
  service_name lazy { apache_platform_service_name }
  supports restart: true, status: true, reload: true
  action :nothing
end

apache2_module 'ssl'
apache2_module 'rewrite'
apache2_module 'vhost_alias'
apache2_module 'php7' do
  mod_name 'libphp7.2.so'
end
apache2_module 'mpm_event' do
  action :disable
end
apache2_module 'mpm_prefork' do
  action :enable
end

# create output dir
directory node['selfsigned_certificate']['destination'] do
  mode 0755
  action :create
  recursive true
end

bash 'selfsigned_certificate' do
  cwd node['selfsigned_certificate']['destination']
  code <<-EOH
        echo "Creating certificate ..."
        openssl genrsa -passout pass:#{node[:selfsigned_certificate][:sslpassphrase]} -des3 -out #{node['fronds']['server_name']}.key 1024
        openssl req -passin pass:#{node[:selfsigned_certificate][:sslpassphrase]} -subj "/C=#{node[:selfsigned_certificate][:country]}/ST=#{node[:selfsigned_certificate][:state]}/L=#{node[:selfsigned_certificate][:city]}/O=#{node[:selfsigned_certificate][:orga]}/OU=#{node[:selfsigned_certificate][:depart]}/CN=#{node[:selfsigned_certificate][:cn]}/emailAddress=#{node[:selfsigned_certificate][:email]}" -new -key #{node['fronds']['server_name']}.key -out #{node['fronds']['server_name']}.csr
        cp #{node['fronds']['server_name']}.key #{node['fronds']['server_name']}.key.org
        openssl rsa -passin pass:#{node[:selfsigned_certificate][:sslpassphrase]} -in #{node['fronds']['server_name']}.key.org -out #{node['fronds']['server_name']}.key
        openssl x509 -req -days 365 -in #{node['fronds']['server_name']}.csr -signkey #{node['fronds']['server_name']}.key -out #{node['fronds']['server_name']}.crt
        echo "Done. Certificate available at #{node[:selfsigned_certificate][:destination]}. Have a good day citizen."
  EOH

end

template 'fronds' do
  extend Apache2::Cookbook::Helpers
  path "#{apache_dir}/sites-available/fronds.conf"
  source 'fronds.conf.erb'
  action :create_if_missing
end

apache2_site 'fronds'

apache2_site '000-default' do
  action :disable
end