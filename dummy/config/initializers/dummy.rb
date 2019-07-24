# Dummy application initializers. Please do not use these in your real
# application!
maeku_core_gem_dir = Gem::Specification.find_by_name("maeku_core").gem_dir

if Rails.env.development?
  Rails.application.config.paths["db/migrate"] << "#{maeku_core_gem_dir}/db/migrate"
end
