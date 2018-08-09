$:.push File.expand_path("../lib", __FILE__)

require_relative "core/lib/maeku/version"

Gem::Specification.new do |s|
  s.name        = "maeku"
  s.version     = Maeku::VERSION
  s.authors     = ["Benjamin Willems"]
  s.email       = ["bw@benjaminwil.info"]
  s.homepage    = "https://github.com/maeku/maeku"
  s.summary     = "A Ruby on Rails-based journalling platform."
  s.description = "A journal for all of your thoughts and feelings."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "maeku_core", s.version 
end
