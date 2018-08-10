$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require_relative "../core/lib/maeku/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "maeku_editor"
  s.version     = Maeku::VERSION
  s.authors     = ["Benjamin Willems"]
  s.email       = ["bw@benjaminwil.info"]
  s.homepage    = "https://github.com/maeku/maeku"
  s.summary     = "Entry and content editor for Maeku."
  s.description = "This gem provides the default editing experience for Maeku-based journals."
  s.license     = "GPL-3.0"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.1"
  s.add_dependency "maeku_core"

  s.add_development_dependency "sqlite3"
end
