FactoryGirl.define do

  factory :city do
    id 1
    name "A City"
  end

  factory :place do
    name "A Place"
    city_id 1
  end

  factory :category1, class: Category do
    category "cool"
  end

  factory :category2, class: Category do
    category "chill"
  end

  factory :category3, class: Category do
    category "serene"
  end
end
