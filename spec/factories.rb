FactoryGirl.define do  factory :place_type do
    description "MyString"
  end
  factory :response do
    response "MyString"
question_id 1
user_id 1
place_id 1
  end
  factory :question do
    option1 "MyString"
option2 "MyString"
option3 "MyString"
option4 "MyString"
option5 "MyString"
place_type_id 1
cat_or_ord "MyString"
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
