source 'https://rubygems.org'

gemspec

gem 'right_git',   :git => 'git@github.com:rightscale/right_git.git',
                   :branch => 'master'
gem 'right_popen', :git => 'git@github.com:rightscale/right_popen.git',
                   :branch => 'teal_13_13_acu115916_fixes_for_linux_process_etc'

gem 'rake',          '0.8.7'
gem 'right_support', '2.7'

group :test do
  gem 'rspec',    '~> 2.0'
  gem 'flexmock', '~> 0.9'
  gem 'rtags',    '~> 0.97'
  gem 'blackwinter-git'
end

group :development do
  # not friendly on daemon server due to lack of installed libs.
  gem 'ruby-debug',   :platform => :ruby_18
  gem 'ruby-debug19', :platform => :ruby_19
  gem 'rdoc',         '~> 2.4'
end
