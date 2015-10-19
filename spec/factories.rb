FactoryGirl.define do

  factory :rating do
    overall 5
    rating1 4
    rating2 5
    rating3 5
    user_id 1
    place_id 4
  end

  factory :rating1, class: Rating do
    overall 5
    rating1 4
    rating2 5
    rating3 4
    user_id 1
    place_id 3
  end

  factory :place_type do
    id 1
    type "Food and Drink"
    axis1 "Ambience"
    axis2 "Food/Drink Quality"
    axis3 "Service"
  end

  factory :answer do
    id 6
    answer "An answer"
    question_id 3
  end

  factory :question do
    id 3
    question "A Question?"
  end

  factory :culture do
    id 3
    title "A Culture"
    description "A description"
  end

  factory :user do
    id 1
    email "An email@com"
    username "A User"
    password "sjkslhjshj"
    password_confirmation "sjkslhjshj"
    culture_id 3
  end

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
    place_type_id 1
  end

  factory :place1, class: Place do
    id 4
    name "Another Place"
    city_id 1
    place_type_id 1
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
