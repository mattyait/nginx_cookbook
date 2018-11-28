#
# Cookbook:: nginx_cookbook
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

remote_file '/mnt' do
  source 'ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.42.tar.gz'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
