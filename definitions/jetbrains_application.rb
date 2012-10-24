#
# Cookbook Name:: jetbrains_application
# definition:: jetbrains_application
#
# Copyright (C) 2012 Lucas Jandrew
#
# All rights reserved - Do Not Redistribute
#

define :jetbrains_application, :internal_name => 'WebIde', :major_version => 5 do

  name = params[:name].downcase
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

  template "/home/#{attributeContext[:user]}/Desktop/#{name}.desktop" do
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

  cookbook_file "/home/#{attributeContext[:user]}/.#{params[:internal_name]}#{params[:major_version]}0/config/#{name}#{params[:major_version]}0.key" do
    owner attributeContext[:user]
    group attributeContext[:user]
    source "#{name}#{params[:major_version]}0.key"
  end

end