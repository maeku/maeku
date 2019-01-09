PROJECTS = %w{core editor}

task :test do
  Dir.pwd { sh "bundle install --quiet" }

  PROJECTS.each do |project|
    Dir.chdir(project) do
      sh "bundle exec rails db:migrate VERBOSE=false RAILS_ENV=test"
      sh "bundle exec rails test"
    end
  end
end

task default: :test
