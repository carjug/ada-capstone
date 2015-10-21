class User < ActiveRecord::Base
  has_secure_password

  # Associations
  has_many :responses

  # Validations
  validates :username, presence: true
  validates :username, uniqueness: true, on: :create

  def self.write_users_object
    users_array = []
    collection  = self.all

    collection.each do |user|
      user_object = {}
      user_object.store("user", user.id)

      responses = user.responses
      responses.each do |response|
        q_counter = ("place_" + response.place_id.to_s + "_question_" + response.question_id.to_s)

        data_counter = ("place_" + response.place_id.to_s + "_data_type_" + response.question_id.to_s)

        response_counter = ("place_" + response.place_id.to_s + "_response_" + response.question_id.to_s)

        question = Question.find(response.question_id)

        user_object.store(q_counter, question.id)
        user_object.store(data_counter, question.cat_or_ord)
        user_object.store(response_counter, response.response)
      end
      users_array << user_object
    end
    return users_array
    # then call parse_data to turn object into something we can write to a csv file
  end

  def self.parse_data(array)
    place_tracker = 1

    array.each do |user|
      question_tracker = 1
      q_var = ("place_" + place_tracker.to_s + "_question_" + question_tracker.to_s)
      r_var = "place_" + place_tracker.to_s + "_response_" + question_tracker.to_s
      data_var = "place_" + place_tracker.to_s + "_data_type_" + question_tracker.to_s
      until question_tracker > 28 do
        obj = {}
        if user.has_key?(q_var) == false
          obj.store(q_var, "")
          obj.store(r_var, "")
          obj.store(data_var, "")
        end
        user.merge!(obj)
        question_tracker +=1
      end
      place_tracker += 1
      if place_tracker > 30
        return
      end
      return array
    end

  end
end

