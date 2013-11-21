#
# Cookbook Name:: jenkins_dg
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "windows"
include_recipe "java"
include_recipe "jenkins_dg::ant"
include_recipe "windows::reboot_handler"
include_recipe "jenkins_dg::ivy"
