require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { build(:question) }
  let(:answer)   { build(:answer) }

  context "when creating a question" do
    it "behaves like an object" do
      expect(question).to be_an_instance_of Question
    end

    it "has a question attribute" do
      expect(question.question).to eq "A Question?"
    end

    it "is associated with answers question" do
      question.save
      answer.save

      expect(question.answers.count).to eq 1
      expect(question.answers[0].answer).to eq "An answer"
    end

    it "needs a question" do
      question.question = ""

      expect(question).to_not be_valid
    end
  end
end
