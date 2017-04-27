#
# Cookbook:: lamp
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

apt_update 'daily' do
  frequency 86_400
  action :periodic
end

app = search("aws_opsworks_app").first
doc_root = app['attributes']['document_root']
node.default['lamp']['web']['document_root'] = doc_root

include_recipe 'lamp::web'
include_recipe 'lamp::database'