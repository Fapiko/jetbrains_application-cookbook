name             "jetbrains_application"
maintainer       "Lucas Jandrew"
maintainer_email "fapiko@fapiko.com"
license          "All rights reserved"
description      "Installs/Configures jetbrains_application"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version IO.read(File.join(File.dirname(__FILE__), 'VERSION')) rescue '0.0.1'

depends 'java'
