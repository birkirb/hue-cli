# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "hue-cli"
  s.version     = '0.1.1'
  s.authors     = ["Birkir A. Barkarson", ""]
  s.email       = ["birkirb@stoicviking.net"]
  s.homepage    = "https://github.com/birkirb/hue-lib"
  s.summary     = %q{Command line interface for controlling Philips Hue system's lights and bridge.}
  s.description = %q{CLI that allows simple printing of bridge and light state, with easy-to-use syntax to manipulate state}

  s.rubyforge_project = "hue-cli"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency("json")
  s.add_runtime_dependency("hue-lib", '>= 0.7.2')
  s.add_development_dependency("rspec", '>= 2.6.0')
  s.add_development_dependency("mocha", '>= 0.9.0')
  s.add_development_dependency("webmock", '>= 1.8.0')
end
