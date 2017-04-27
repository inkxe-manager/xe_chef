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

instance = search("aws_opsworks_instance").first
layer = search("aws_opsworks_layer").first
stack = search("aws_opsworks_stack").first

Chef::Log.info("********** This instance's instance ID is '#{instance['instance_id']}' **********")
Chef::Log.info("********** This instance's public IP address is '#{instance['public_ip']}' **********")
Chef::Log.info("********** This instance belongs to the layer '#{layer['name']}' **********")
Chef::Log.info("********** This instance belongs to the stack '#{stack['name']}' **********")
Chef::Log.info("********** This stack gets its cookbooks from '#{stack['custom_cookbooks_source']['url']}' **********")
Chef::Log.info("********** This instance's Document Root  is '#{doc_root}' **********")



include_recipe 'lamp::web'
include_recipe 'lamp::database'