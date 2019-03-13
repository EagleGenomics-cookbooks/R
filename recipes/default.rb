#
# Cookbook:: R
# Recipe:: default
#
# Copyright:: 2019, Eagle Genomics Ltd, All Rights Reserved.

apt_update

package 'software-properties-common'

apt_repository 'bionic-cran35' do
  distribution ''
  uri 'https://cloud.r-project.org/bin/linux/ubuntu'
  key 'E298A3A825C0D65DFD57CBB651716619E084DAB9'
  keyserver 'keyserver.ubuntu.com'
  components ['bionic-cran35/']
end

package 'r-base'

build_essential 'install essential' do
  action :install
end

chef_gem 'rinruby'

# install all locales to avoid any 'locale not found' errors during package installation
package 'locales-all' do
  only_if { node['platform_family'] == 'debian' }
end

node['R']['packages'].each do |rpackage|
  ruby_block 'R packages' do
    block do
      require 'rinruby'
      R.eval "install.packages('#{rpackage}')", true
    end
  end
end
