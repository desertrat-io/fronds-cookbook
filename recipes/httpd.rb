include_recipe 'apache2'
include_recipe 'apache2::mod_rewrite'
include_recipe 'apache2::mod_ssl'

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
        openssl genrsa -passout pass:#{node[:selfsigned_certificate][:sslpassphrase]} -des3 -out #{node['friends']['server_name']}.key 1024
        openssl req -passin pass:#{node[:selfsigned_certificate][:sslpassphrase]} -subj "/C=#{node[:selfsigned_certificate][:country]}/ST=#{node[:selfsigned_certificate][:state]}/L=#{node[:selfsigned_certificate][:city]}/O=#{node[:selfsigned_certificate][:orga]}/OU=#{node[:selfsigned_certificate][:depart]}/CN=#{node[:selfsigned_certificate][:cn]}/emailAddress=#{node[:selfsigned_certificate][:email]}" -new -key #{node['friends']['server_name']}.key -out #{node['friends']['server_name']}.csr
        cp #{node['friends']['server_name']}.key #{node['friends']['server_name']}.key.org
        openssl rsa -passin pass:#{node[:selfsigned_certificate][:sslpassphrase]} -in #{node['friends']['server_name']}.key.org -out #{node['friends']['server_name']}.key
        openssl x509 -req -days 365 -in #{node['friends']['server_name']}.csr -signkey #{node['friends']['server_name']}.key -out #{node['friends']['server_name']}.crt
        echo "Done. Certificate available at #{node[:selfsigned_certificate][:destination]}. Have a good day citizen."
  EOH

end

web_app 'friends' do
  template 'friend.conf.erb'
  doc_root "#{node['friends']['vm_doc_root']}/#{node['friends']['site_folder']}/public"
end