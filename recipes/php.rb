apt_repository 'ondrej-php' do
  uri 'ppa:ondrej/php'
  components %w(main stable)
end

apt_update

package 'php7.2'
package 'libapache2-mod-php7.2'
package 'php7.2-cli'
package 'php7.2-common'
package 'php7.2-mbstring'
package 'php7.2-intl'
package 'php7.2-xml'
package 'php7.2-mysql'
package 'php7.2-zip'
package 'php7.2-xdebug'
package 'php7.2-bcmath'
package 'php7.2-curl'

template node['fronds']['php']['xdebug_conf'] do
  source 'xdebug.ini.erb'
  mode '0644'
end