#
# Cookbook:: graphite
# Resource:: resource_carbon_conf_accumulator
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

actions :create
default_action :create

attribute :file_resource, kind_of: String, default: 'file[carbon.conf]'
attribute :sort_configs, kind_of: [TrueClass, FalseClass], default: true

def initialize(*args)
  super
  @provider = Chef::Provider::SocrataGraphiteForkCarbonConfAccumulator
end

def carbon_resources
  [:socrata_graphite_fork_carbon_cache, :socrata_graphite_fork_carbon_relay, :socrata_graphite_fork_carbon_aggregator]
end
