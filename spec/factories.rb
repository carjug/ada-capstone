FactoryGirl.define do

  factory :city do
    id 1
    name "A City"
  end

  factory :place do
    name "A Place"
    city_id 1
  end
end
