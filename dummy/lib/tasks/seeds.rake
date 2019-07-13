require "active_record/fixtures"

namespace :maeku do
  namespace :dummy do
    namespace :db do

      task :seed => :environment do
        core_dir = Gem::Specification.find_by_name('maeku_core').gem_dir
        fixtures_dir = File.join(core_dir, "test/fixtures")
        yml_files = Dir["#{fixtures_dir}/**/*.yml"]
        fixture_files = yml_files.map { |yml| yml[(fixtures_dir.size + 1)..-5] }
        ActiveRecord::FixtureSet.create_fixtures(fixtures_dir, fixture_files)
      end

    end
  end
end
