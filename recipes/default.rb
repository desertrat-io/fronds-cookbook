#
# Cookbook:: fronds
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'fronds::packages'
include_recipe 'fronds::httpd'
include_recipe 'fronds::php'
include_recipe 'fronds::db'
include_recipe 'fronds::post'