require File.expand_path(File.dirname(__FILE__) + "/environment")

# Rails whenever environment is currently set to development -- need to change this for production!

# Background offline jobs

@environment = Rails.env

if @environment == "development"

  set :output, "#{Rails.root}/log/cron.log"

  every 10.minutes do
    command "/usr/local/bin/python #{Rails.root}/lib/recommender/py_recommender.py"
  end

  every 15.minutes do
    runner "Place.write_csv"
    runner "User.create_user_recommendations"
  end
end

if @environment == "production"
  set :output, "#{Rails.root}/log/production.log"

  every 5.minutes do
    command "/usr/local/bin/python #{Rails.root}/lib/recommender/py_recommender.py"
  end

  every 1.minutes do
    runner "Place.write_csv"
    runner "User.create_user_recommendations"
  end
end
