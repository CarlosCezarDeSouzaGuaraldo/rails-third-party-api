require "rails_helper"

RSpec.describe Character do
  let (:id) { nil }
  let (:character) { Character.new(id) }

  describe ".new" do
    context "When provides a number ID" do
      let(:id) { 99 }
      it "sets ID to a number" do
        expect(character.id).to eq(id)
      end
    end

    context "When the provides a string number" do
      let(:id) { "99" }
      it "sets ID to a number" do
        expect(character.id).to eq(99)
      end
    end

    context "When the provides a string number, but it's not a number" do
      let (:id) { "notanumber" }
      it "sets ID to a nil" do
        expect(character.id).to be_blank
      end
    end

    context "When provides a nil ID" do
      it "sets ID to a nil" do
        expect(character.id).to be_blank
      end
    end
  end

  describe "When check to a valid character" do
    context "When ID is a number" do
      let(:id) { 12 }
      it "Character is valid" do
        expect(character.valid?).to be_truthy
      end
    end

    context "When ID is a string number" do
      let(:id) { "12" }
      it "Character is valid" do
        expect(character.valid?).to be_truthy
      end
    end

    context "When ID is a invalid string" do
      let(:id) { "string" }
      it "Character is valid" do
        expect(character.valid?).to be_falsey
      end
    end

    context "When ID is an empty string" do
      let(:id) { "" }
      it "Character is valid" do
        expect(character.valid?).to be_falsey
      end
    end

    context "When ID is nil" do
      it "Character isn't valid" do
        expect(character.valid?).to be_falsey
      end
    end
  end

  describe "When it's going to fetch the character data" do
    context "When the character is valid" do
      let(:id) { 15 }
      it "Return the character's data" do
        expect(character.fetch_character_data).not_to be_nil
      end
    end

    context "When the character is invalid" do
      let(:id) { "anystring" }
      it "Return nil" do
        expect(character.fetch_character_data).to be_nil   
      end
    end

    context "When the character ID is a large number" do
      let(:id) { 12542345234 }
      it "Return nil" do
        expect(character.fetch_character_data).to be_nil   
      end
    end
  end
end