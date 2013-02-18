#
# Cookbook Name:: jetbrains_application
# Recipe:: intellij
#
# Copyright (C) 2012 Lucas Jandrew
#
# All rights reserved - Do Not Redistribute
#

jetbrains_application :IntelliJ do
  internal_name :IntelliJIdea
  major_version 12
  runfile 'idea.sh'
end
