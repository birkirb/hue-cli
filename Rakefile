require 'rake'

begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new('spec') do |t|
    t.rspec_opts = ["-fd", "-c"]
    t.ruby_opts = ["-Ispec,lib"]
    t.pattern = 'spec/**/*_spec.rb'
  end

rescue LoadError
  desc 'Spec rake task not available'
  task :spec do
    abort 'Spec rake task is not available. Be sure to install rspec as a gem or plugin'
  end
end

namespace :gem do
  desc 'Build the gem'
  task :build do
    `mkdir -p pkg`
    `gem build hue-cli.gemspec`
    `mv *.gem pkg/`
  end

  desc 'Publish the gem'
  task :publish => :build do
    gem = `ls pkg | sort | tail -n 1`
    exec("gem push pkg/#{gem}")
  end

  desc 'Install the gem locally'
  task :install => :build do
    gem = `ls pkg`.split.sort
    `gem install pkg/#{gem.last}`
  end
end

desc 'Remove generated files'
task :clean do
  `rm -rf pkg`
end

task :default => [:spec]
