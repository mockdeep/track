desc "populate database records for development"
task :populate => :environment do
  raise "Bad! Not to be used in production!" if Rails.env.production?
end
