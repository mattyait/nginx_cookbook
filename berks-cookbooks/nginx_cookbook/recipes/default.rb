#
# Cookbook:: nginx_cookbook
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# PCRE – Supports regular expressions. Required by the NGINX Core and Rewrite modules.
remote_file '/mnt/pcre-8.42.tar.gz' do
  source 'ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.42.tar.gz'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

tar_extract '/mnt/pcre-8.42.tar.gz' do
  action :extract_local
  target_dir '/mnt/pcre-8.42'
  creates '/mnt/pcre-8.42'
end
