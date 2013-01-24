#
# Cookbook Name:: jetbrains_application
# definition:: jetbrains_application
#
# Copyright (C) 2012 Lucas Jandrew
#
# All rights reserved - Do Not Redistribute
#

require 'base64'

define :jetbrains_application, :internal_name => 'WebIde', :major_version => 5 do

  name = params[:name].to_s.downcase
  node.set[:applications][:jetbrains][name][:user] = node[:applications][:user]
  attributeContext = node[:applications][:jetbrains][name]

  shortname = "#{name}-#{attributeContext[:version]}"
  filename = "#{shortname}.tar.gz"
  extract_path = "#{Chef::Config['file_cache_path']}/#{shortname}"
  filepath = "#{attributeContext[:dir]}/#{shortname}"

  remote_file "#{Chef::Config['file_cache_path']}/#{shortname}.tar.gz" do
    source attributeContext[:url]
    checksum attributeContext[:checksum]
  end

  directory filepath do
    owner attributeContext[:user]
    group attributeContext[:user]
    mode 0755
    recursive true
    action :create
  end

  bash "extract #{name}" do
    cwd Chef::Config['file_cache_path']
    code <<-EOH
    mkdir -p #{extract_path}
    tar -xzf #{filename} -C #{extract_path}
    mv -f #{extract_path}/*/* #{filepath}
    chown -R #{attributeContext[:user]}: #{filepath}
    EOH

    not_if { ::File.exists?("#{filepath}/bin") }
  end

  link "#{attributeContext[:dir]}/current" do
    to filepath
  end

  template "/home/#{attributeContext[:user]}/Desktop/jetbrains-#{name}.desktop" do
    source 'application_icon.desktop.erb'
    cookbook 'jetbrains_application'
    owner attributeContext[:user]
    group attributeContext[:user]
    mode 0744
    variables(
      :name => params[:name],
      :internal_name => params[:internal_name]
    )
  end

  template "/home/#{attributeContext[:user]}/.local/share/applications/jetbrains-#{name}.desktop" do
    source 'application_icon.desktop.erb'
    cookbook 'jetbrains_application'
    owner attributeContext[:user]
    group attributeContext[:user]
    mode 0744
    variables(
        :name => params[:name],
        :internal_name => params[:internal_name]
    )
  end

  if Chef::Config.solo
    jetbrains_licenses = Chef::DataBagItem.load('jetbrains_application', 'licenses')
  else
    jetbrains_licenses = Chef::EncryptedDataBagItem.load('jetbrains_application', 'licenses')
  end

  if jetbrains_licenses[name]
    
    directory "/home/#{attributeContext[:user]}/.#{params[:internal_name]}#{params[:major_version]}0/config" do
      owner attributeContext[:user]
      group attributeContext[:user]
      mode 0755
      recursive true
    end

	file "/home/#{attributeContext[:user]}/.#{params[:internal_name]}#{params[:major_version]}0/config/#{name}#{params[:major_version]}0.key" do
      owner attributeContext[:user]
      group attributeContext[:user]
      mode 0744
      content Base64.decode64(jetbrains_licenses[name])
    end
  else
    log "[Jetbrains #{params[:name]}] has been installed as an evaluation"
  end

end
