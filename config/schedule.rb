require File.expand_path(File.dirname(__FILE__) + "/environment")

# Rails whenever environment is currently set to development -- need to change this for production!

# Background offline jobs
# need to add new rails methods to scheduler on heroku
# booooom botch!

  set :output, "#{Rails.root}/log/cron.log"

  every 2.minutes do
    py_path = `which python`
    command "#{py_path} #{Rails.root}/lib/recommender/py_recommender.py"
  end

  every 1.minutes do
    runner "Place.write_csv"
    runner "User.create_user_recommendations"
  end

