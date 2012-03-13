# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "garaio-changelog/version"

Gem::Specification.new do |s|
  s.name        = "garaio-changelog"
  s.version     = Changelog::VERSION
  s.authors     = ['Yves Senn', 'Jonas Baumann', 'Samuel Tonini']
  s.email       = ['yves.senn@garaio.com', 'j.baumann@jone.ch', 'samuel.tonini@garaio.com']
  s.homepage    = ""
  s.summary     = %q{Git Changelog}
  s.description = %q{Convert the git history into a nice Changelog}

  s.rubyforge_project = "garaio-changelog"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_runtime_dependency "virtus"
end
