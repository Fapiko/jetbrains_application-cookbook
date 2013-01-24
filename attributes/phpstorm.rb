default[:applications][:jetbrains][:phpstorm][:version] = '5.0.4'

default[:applications][:jetbrains][:phpstorm][:url] = "http://download.jetbrains.com/webide/PhpStorm-#{node[:applications][:jetbrains][:phpstorm][:version]}.tar.gz"
default[:applications][:jetbrains][:phpstorm][:checksum] = 'ad5797a28a8580ce380ddc6c0c8d105a58e53defbb96af16f2a8031520392ef3'

default[:applications][:jetbrains][:phpstorm][:dir] = '/opt/phpstorm'

default[:applications][:jetbrains][:phpstorm][:user] = node[:applications][:user] = 'ljandrew'
