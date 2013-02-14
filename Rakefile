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
  task :build do
    `mkdir -p pkg`
    `gem build hue-cli.gemspec`
    `mv *.gem pkg/`
  end

  task :publish do
    gem = `ls pkg`
    # `gem push pkg/#{gem}`
  end

  task :install do
    gem = `ls pkg`
    `gem install pkg/#{gem}`
  end
end

task :default => [:spec]
