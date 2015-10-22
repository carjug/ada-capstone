require File.expand_path(File.dirname(__FILE__) + "/environment")
# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Rails whenever environment is currently set to development -- need to change this for production!

# Example:

set :output, "#{Rails.root}/log/cron.log"

every 10.minutes do
  command "/usr/local/bin/python #{Rails.root}/lib/recommender/py_recommender.py"
end

every 15.minutes do
  runner "Place.write_csv"
  runner "User.create_user_recommendations"
end


#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
