FactoryGirl.define do
  factory :country do
    id 10
    name "A Country"
  end

  factory :prov do
    id 5
    name "A Prov"
    country_id 10
  end

  factory :city do
    id 1
    name "A City"
    prov_id 5
  end

  factory :place do
    id 3
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
