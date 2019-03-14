name             'socrata-graphite-fork'
maintainer       'Socrata,Inc'
maintainer_email 'sysadmin@socrata.com'
license          'Apache 2.0'
description      'Installs/Configures graphite'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '999.0.3'

supports 'ubuntu'
supports 'debian'
supports 'redhat'
supports 'centos'
supports 'amazon'
supports 'scientific'
supports 'oracle'
supports 'fedora'

depends  'python'
depends  'runit'
depends  'build-essential'
depends  'yum-epel'

suggests 'systemd'
suggests 'graphiti'
suggests 'delayed_evaluator'

source_url 'https://github.com/socrata-cookbooks/socrata-graphite-fork' if respond_to?(:source_url)
issues_url 'https://github.com/socrata-cookbooks/socrata-graphite-fork/issues' if respond_to?(:issues_url)
