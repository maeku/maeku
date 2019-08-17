namespace :maeku do
  namespace :dummy do
    task :setup => :environment do
      %w[
        db:drop db:schema:load db:migrate db:setup
        maeku:dummy:db:seed
      ].each do |task|
        ENV["RAILS_ENV"] = "development"
        Rake::Task[task].invoke
      end
    end
  end
end
