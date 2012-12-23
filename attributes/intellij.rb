default[:applications][:jetbrains][:intellij][:flavor] = 'community'

default[:applications][:jetbrains][:intellij][:version] = '12.0.1'

case node[:applications][:jetbrains][:intellij][:flavor]
  when 'community'
    download_prefix = 'ideaIC'
    if node[:applications][:jetbrains][:intellij][:version] == default[:applications][:jetbrains][:intellij][:version]
      checksum = 'bca84ddd8491df0a283a70c9f3c205a244cbc2fdd1da8bf064b956da5a5e49ef'
    else
      checksum = node[:applications][:jetbrains][:intellij][:checksum]
    end
  when 'ultimate'
    download_prefix = 'ideaIU'
    if node[:applications][:jetbrains][:intellij][:version] == default[:applications][:jetbrains][:intellij][:version]
      checksum = 'baabfdb82051d27b681a7fc139b912a31f4a04f0106391672de47897aa84d1ca'
    else
      checksum = node[:applications][:jetbrains][:intellij][:checksum]
    end
end
default[:applications][:jetbrains][:intellij][:url] = "http://download.jetbrains.com/idea/#{download_prefix}-#{node[:applications][:jetbrains][:intellij][:version]}.tar.gz"
default[:applications][:jetbrains][:intellij][:checksum] = checksum

default[:applications][:jetbrains][:intellij][:dir] = '/opt/intellij'

default[:applications][:jetbrains][:intellij][:user] = node[:applications][:user]
