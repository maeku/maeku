$:.push File.expand_path("../lib", __FILE__)

require "maeku/version"

Gem::Specification.new do |s|
  s.name        = "maeku_core"
  s.version     = Maeku::VERSION
  s.authors     = ["Benjamin Willems"]
  s.email       = ["bw@benjaminwil.info"]
  s.homepage    = "https://github.com/maeku/maeku"
  s.summary     = "A Ruby on Rails-based journalling platform."
  s.description = "A journal for all of your thoughts and feelings."
  s.license     = "GPL-3.0"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2"
  s.add_dependency "active_storage_validations", "~> 0.5"

  s.add_development_dependency "sqlite3", "1.3.11"
end
