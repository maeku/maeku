namespace :maeku do
  namespace :dummy do
    task :setup => :environment do
      %w( db:drop db:migrate db:setup maeku:dummy:db:seed ).each do |task|
        Rake::Task[task].invoke
      end
    end
  end
end
