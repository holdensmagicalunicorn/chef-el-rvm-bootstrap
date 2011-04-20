#
# Modified By:: Matthew Kent
# Original Author:: Joshua Timberman <joshua@opscode.com>
# Cookbook Name:: chef
# Attributes:: default
#
# Copyright 2008-2010, Opscode, Inc
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

default[:chef][:umask]      = "0022"
default[:chef][:url_type]   = "http"

default[:chef][:path]       = "/var/lib/chef"
default[:chef][:serve_path] = "/var/lib/chef"
default[:chef][:run_path]   = "/var/run/chef"
default[:chef][:cache_path] = "/var/cache/chef"
default[:chef][:backup_path] = "/var/lib/chef/backup"

default[:chef][:server_version]  = node.chef_packages.chef[:version]
default[:chef][:client_version]  = node.chef_packages.chef[:version]
default[:chef][:client_interval] = "1800"
default[:chef][:client_splay]    = "20"
default[:chef][:log_dir]         = "/var/log/chef"
default[:chef][:server_port]     = "4000"
default[:chef][:webui_port]      = "4040"
default[:chef][:webui_enabled]   = false
default[:chef][:solr_heap_size]  = "256M"
default[:chef][:validation_client_name] = "chef-validator"

default[:chef][:server_fqdn]     = node.has_key?(:domain) ? "chef.#{domain}" : "chef"
default[:chef][:server_url]      = "#{node.chef.url_type}://#{node.chef.server_fqdn}:#{node.chef.server_port}"

default[:chef][:rvm_ruby] = "1.9.2-p180@chef"
default[:chef][:rvm_binary] = "/usr/local/bin/rvm"
