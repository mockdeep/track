desc 'Re-calculate averages for all items'
task :update_averages => :environment do
  Item.update_averages!
end
