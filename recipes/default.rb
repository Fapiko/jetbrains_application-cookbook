#
# Cookbook Name:: jetbrains_application
# Recipe:: default
#
# Copyright (C) 2012 Lucas Jandrew
# 
# All rights reserved - Do Not Redistribute
#

include_recipe 'java'

node[:applications][:jetbrains][:install].each do |application|
	include_recipe "#{@cookbook_name}::#{application}"
end
