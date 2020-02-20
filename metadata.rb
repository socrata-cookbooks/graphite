name             'socrata-graphite-fork'
maintainer       'Socrata,Inc'
maintainer_email 'sysadmin@socrata.com'
license          'Apache 2.0'
description      'Installs/Configures graphite'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '999.1.3'

supports 'ubuntu'
supports 'debian'
supports 'redhat'
supports 'centos'
supports 'scientific'
supports 'oracle'

depends  'snu_python', '>= 0.2.0'

source_url 'https://github.com/socrata-cookbooks/socrata-graphite-fork'
issues_url 'https://github.com/socrata-cookbooks/socrata-graphite-fork/issues'
chef_version '>= 12.11' if respond_to?(:chef_version)
