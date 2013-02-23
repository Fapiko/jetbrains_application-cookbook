#
# Cookbook Name:: jetbrains_application
# Attributes:: pycharm
#
# Copyright (C) 2012 Lucas Jandrew
#
# All rights reserved - Do Not Redistribute
#

default[:applications][:jetbrains][:pycharm][:version] = '2.7'

default[:applications][:jetbrains][:pycharm][:url] = "http://download.jetbrains.com/python/pycharm-#{node[:applications][:jetbrains][:pycharm][:version]}.tar.gz"
default[:applications][:jetbrains][:pycharm][:checksum] = '4161e1488cc14429695274de8b6594f7fca4c8a88714e3ddb795fee95afd4f30'

default[:applications][:jetbrains][:pycharm][:dir] = '/opt/pycharm'

default[:applications][:jetbrains][:pycharm][:user] = node[:applications][:user]
