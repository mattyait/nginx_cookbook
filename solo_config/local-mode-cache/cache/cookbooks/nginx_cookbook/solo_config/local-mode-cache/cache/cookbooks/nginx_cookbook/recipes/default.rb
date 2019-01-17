#
# Cookbook:: nginx_cookbook
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# PCRE – Supports regular expressions. Required by the NGINX Core and Rewrite modules.
remote_file '/tmp/pcre-8.42.tar.gz' do
  source node['nginx']['pcre']['package_path']
  owner node['nginx']['user']
  group node['nginx']['group']
  mode '0755'
  action :create
end

# Extracting the tar file to specific location
tar_extract '/tmp/pcre-8.42.tar.gz' do
  action :extract_local
  target_dir node['nginx']['pcre']['installation_path']
  creates node['nginx']['pcre']['installation_path'] + '/cmake'
end

bash 'Install PCRE' do
  code <<-EOH
    cd #{node['nginx']['pcre']['installation_path']}/pcre-8.42
    ./configure
    make
    make install
    EOH
end

# zlib – Supports header compression. Required by the NGINX Gzip module.
remote_file '/tmp/zlib-1.2.11.tar.gz' do
  source node['nginx']['zlib']['package_path']
  owner node['nginx']['user']
  group node['nginx']['group']
  mode '0755'
  action :create
end

tar_extract '/tmp/zlib-1.2.11.tar.gz' do
  action :extract_local
  target_dir node['nginx']['zlib']['installation_path']
  creates node['nginx']['zlib']['installation_path'] + '/Makefile'
end

bash 'Install ZLIB' do
  code <<-EOH
    cd #{node['nginx']['zlib']['installation_path']}/zlib-1.2.11
    ./configure
    make
    make install
    EOH
end

# OpenSSL – Supports the HTTPS protocol. Required by the NGINX SSL module and others.
remote_file '/tmp/openssl-1.0.2q.tar.gz' do
  source node['nginx']['openssl']['package_path']
  owner node['nginx']['user']
  group node['nginx']['group']
  mode '0755'
  action :create
end

tar_extract '/tmp/openssl-1.0.2q.tar.gz' do
  action :extract_local
  target_dir node['nginx']['openssl']['installation_path']
  creates node['nginx']['openssl']['installation_path'] + '/Makefile'
end

bash 'Install OPENSSL' do
  code <<-EOH
    cd #{node['nginx']['openssl']['installation_path']}/openssl-1.0.2q
    ./Configure
    make
    make install
    EOH
end


remote_file '/tmp/nginx-1.14.2.tar.gz' do
  source node['nginx']['package']['path']
  owner node['nginx']['user']
  group node['nginx']['group']
  mode '0755'
  action :create
end

tar_extract '/tmp/nginx-1.14.2.tar.gz' do
  action :extract_local
  target_dir node['nginx']['installation_path']
  creates node['nginx']['installation_path'] + '/Makefile'
end

bash 'Install nginx' do
  code <<-EOH
    cd #{node['nginx']['installation_path']}/nginx-1.14.2
    ./configure
    make
    make install
    EOH
end