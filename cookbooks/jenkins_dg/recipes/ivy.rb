#
# Author:: Doug MacEachern <dougm@vmware.com>
# Cookbook Name:: windows
# Recipe:: ivy
#
# Copyright 2010, VMware, Inc.
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

directory node[:ivy][:dir] do
  action :create
  recursive true
end

ivy_file_name = "ivy-#{node[:ivy][:release]}"
dir = "apache-#{ivy_file_name}"
zip = "#{dir}-bin.zip"
dst = "#{node[:ivy][:dir]}/#{zip}"
home = "#{node[:ivy][:dir]}/#{dir}"

remote_file dst do
  source "#{node[:ivy][:mirror]}/#{zip}"
  not_if { File.exists?(dst) }
end

ivy_jar_file = "#{ivy_file_name}.jar"
ivy_jar = "#{node[:ivy][:dir]}/#{dir}/#{ivy_jar_file}"

windows_zipfile node[:ivy][:dir] do
  source dst
  action :unzip
  not_if { File.exists?("#{ivy_jar}") }
end

ant_dir = "#{ENV['ANT_HOME']}"
ant_lib_dr = "#{ant_dir}/lib"
ivy_jar_target = "#{ant_lib_dr}/#{ivy_jar_file}"

remote_file ivy_jar_target do
  source "file://#{ivy_jar}"
  not_if { File.exists?(ivy_jar_target) }
end

#copy ivy.jar nach ant_lib_dr
