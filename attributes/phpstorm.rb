default[:applications][:jetbrains][:phpstorm][:version] = '5.0.4'

default[:applications][:jetbrains][:phpstorm][:url] = "http://download.jetbrains.com/webide/PhpStorm-#{node[:applications][:jetbrains][:phpstorm][:version]}.tar.gz"
default[:applications][:jetbrains][:phpstorm][:checksum] = '28f210fac7d0d248d86a3c180a2e71db9eefb1f0495f3ff5d3b6fc8862b54f09'

default[:applications][:jetbrains][:phpstorm][:dir] = '/opt/phpstorm'

default[:applications][:jetbrains][:phpstorm][:user] = node[:applications][:user] = 'ljandrew'
