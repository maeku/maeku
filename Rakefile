PROJECTS = %w{core editor}

task :test do
  Dir.pwd do
    sh "bundle install"
  end

  PROJECTS.each do |project|
    Dir.chdir(project) do
      sh "bundle install"
      sh "bundle exec rails db:migrate RAILS_ENV=test"
      sh "bundle exec rails test"
    end
  end
end

task default: :test
