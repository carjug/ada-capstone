require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question) { build(:question) }
  let(:answer)   { build(:answer) }

  context "when creating a answer" do
    it "behaves like an object" do
      expect(answer).to be_an_instance_of Answer
    end

    it "has a answer attribute" do
      expect(answer.answer).to eq "An answer"
    end

    it "is associated with a question" do
      expect(answer.question_id).to eq question.id
    end

    it "needs a answer" do
      answer.answer = ""

      expect(answer).to_not be_valid
    end

    it "needs a question_id" do
      answer.question_id = ""

      expect(answer).to_not be_valid
    end
  end
end
