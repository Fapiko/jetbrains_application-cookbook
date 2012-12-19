#
# Cookbook Name:: jetbrains_application
# Attributes:: pycharm
#
# Copyright (C) 2012 Lucas Jandrew
#
# All rights reserved - Do Not Redistribute
#

default[:applications][:jetbrains][:pycharm][:version] = '2.6.2'

default[:applications][:jetbrains][:pycharm][:url] = "http://download.jetbrains.com/python/pycharm-#{node[:applications][:jetbrains][:pycharm][:version]}.tar.gz"
default[:applications][:jetbrains][:pycharm][:checksum] = 'e0b334589ef06969fb0a2c59a1a78a6ca55805a5a1faf675d9748931fb3d71e0'

default[:applications][:jetbrains][:pycharm][:dir] = '/opt/pycharm'

default[:applications][:jetbrains][:pycharm][:user] = node[:applications][:user]
