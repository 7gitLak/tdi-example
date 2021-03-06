#
# Cookbook Name:: irc
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
user "tdi" do
	action :create
	home "/home/tdi"
	shell "/bin/bash"
	supports :manage_home => true
end

file "/home/tdi/.tdi" do
	action :create
	content "bogus"
end

package "irssi" do
	action :install
end

directory "/home/tdi/.irrsi" do
	owner "tdi"
	group "tdi"
	action :create
end

cookbook_file "/home/tdi/.irrsi/config" do
	owner "tdi"
	group "tdi"
	source "irssi-config"
end

