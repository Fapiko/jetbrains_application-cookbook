#
# Cookbook Name:: jetbrains_application
# Recipe:: intellij
#
# Copyright (C) 2012 Lucas Jandrew
#
# All rights reserved - Do Not Redistribute
#

case node[:applications][:jetbrains][:intellij][:flavor]
  when :community
    application_name = :ideaIC
  when :ultimate
    application_name = :ideaIU
end

jetbrains_application application_name do
  internal_name :IntelliJIdea
  major_version 12
end
