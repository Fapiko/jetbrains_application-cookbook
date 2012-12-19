default[:applications][:jetbrains][:rubymine][:version] = '4.5.4'

default[:applications][:jetbrains][:rubymine][:url] = "http://download.jetbrains.com/ruby/RubyMine-#{node[:applications][:jetbrains][:rubymine][:version]}.tar.gz"
default[:applications][:jetbrains][:rubymine][:checksum] = '6f0bc3a4923bd832b279cd2a45fd3515ddf8e666c70b65d671452fe4e807c43b'

default[:applications][:jetbrains][:rubymine][:dir] = '/opt/rubymine'

default[:applications][:jetbrains][:rubymine][:user] = node[:applications][:user]
