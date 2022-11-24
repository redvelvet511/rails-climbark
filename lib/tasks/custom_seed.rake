namespace :db do
  namespace :seed do

    # Run rails db:seed:all to reseed everything, including areas, lines and their photos
    task :base => :environment do
      load(File.join(Rails.root, 'db', 'seed_all.rb'))
    end

  end
end
