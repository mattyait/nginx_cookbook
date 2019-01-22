#
# Cookbook:: nginx_cookbook
# Spec:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'nginx_cookbook::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end
    
    it 'PCRE module download' do
      expect(chef_run).to create_remote_file('/tmp/pcre-8.42.tar.gz')
    end

    it 'Install PCRE module' do
      expect(chef_run).to run_bash('Install PCRE')
    end
    
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    
  end

  context 'When all attributes are default, on CentOS 7.4.1708' do
    let(:chef_run) do
      # for a complete list of available platforms and versions see:
      # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.4.1708')
      runner.converge(described_recipe)
    end
    
    it 'PCRE module download' do
      expect(chef_run).to create_remote_file('/tmp/pcre-8.42.tar.gz')
    end
    
    it 'Install PCRE module' do
      expect(chef_run).to run_bash('Install PCRE')
    end
    
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
