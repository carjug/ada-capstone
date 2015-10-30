task write_s3: :environment do
  Place.write_S3
end

task run_py: :environment do
  exec("python #{Rails.root}/lib/recommender/py_recommender.py")
end

task write_user_recs: :environment do
  User.create_user_recs_from_s3
end

