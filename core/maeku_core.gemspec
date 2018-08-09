$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "maeku/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "maeku_core"
  s.version     = Maeku::VERSION
  s.authors     = ["Benjamin Willems"]
  s.email       = ["bw@benjaminwil.info"]
  s.homepage    = "https://github.com/maeku"
  s.summary     = "A Ruby on Rails-based journalling platform."
  s.description = "A journal for all of your thoughts and feelings."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2"

  s.add_development_dependency "sqlite3", "1.3.11"
end
