#
# Cookbook Name:: socrata-graphite-fork
# Recipe:: carbon
#
# Copyright:: 2014-2016, Heavy Water Software Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

python_runtime 'carbons_python' do
  provider :system
  version '2.7'
  options pip_version: true
end

include_recipe '::_user'

directory node['graphite']['base_dir'] do
  owner node['graphite']['user']
  group node['graphite']['group']
end

python_virtualenv node['graphite']['base_dir'] do
  user node['graphite']['user']
  group node['graphite']['group']
end

include_recipe '::_user'
include_recipe '::_carbon_packages'
include_recipe '::_directories'
include_recipe '::_carbon_config'
