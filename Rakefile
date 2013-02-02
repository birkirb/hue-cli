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

task :default => [:spec]
