name 'fronds'
maintainer 'Mike Lawson'
maintainer_email 'mike@desertrat.io'
license 'MIT'
description 'Installs/Configures fronds'
long_description 'Installs/Configures fronds'
version '0.1.1'
chef_version '>= 13.0'
supports 'ubuntu'
# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
issues_url 'https://github.com/desertrat-io/fronds-cookbook/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
source_url 'https://github.com/desertrat-io/fronds-cookbook'

depends 'apache2'
depends 'mysql'
depends 'mysql2_chef_gem'
