#
# Cookbook:: friend_sites
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'openssl-source'

include_recipe 'friend_sites::packages'
include_recipe 'friend_sites::httpd'
include_recipe 'friend_sites::php'
include_recipe 'friend_sites::db'
include_recipe 'friend_sites::post'