#
# Modified By:: Matthew Kent
# Original Author:: Joshua Timberman (<joshua@opscode.com>)
# Original Author:: Seth Chisamore (<schisamo@opscode.com>)
# Cookbook Name:: chef
# Recipe:: bootstrap_client
#
# Copyright 2009-2011, Opscode, Inc.
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

recipe_name = self.recipe_name
cookbook_name = self.cookbook_name

include_recipe "chef-client::config"

template "/etc/init.d/chef-client" do
  source "redhat/init.d/chef-client.erb"
  mode 0755
  variables(
    :recipe_name => recipe_name,
    :cookbook_name => cookbook_name
  )
  notifies :restart, "service[chef-client]", :delayed
end

template "/etc/logrotate.d/chef-client" do
  source "redhat/logrotate.d/chef-client.logrotate.erb"
  owner "root"
  group "root"
  mode 0644
  variables(
    :recipe_name => recipe_name,
    :cookbook_name => cookbook_name
  )
end

service "chef-client" do
  supports :status => true, :restart => true
  action [ :enable, :start ]
end
