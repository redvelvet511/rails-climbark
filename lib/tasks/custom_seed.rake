namespace :db do
  namespace :seed do

    # Run rails db:seed:base to reseed areas and lines and attach their photos
    task :base => :environment do
      load(File.join(Rails.root, 'db', 'seed_all.rb'))
    end

  end
end
