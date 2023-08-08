require "rails_helper"

RSpec.describe Character do

    describe "When initialize a new character" do

        it "When the id provided is nil" do
            character = Character.new(nil)
            expect(character.id).to eq(nil)
        end

        it "When the id provided is a number" do
            character = Character.new(99)
            expect(character.id).to eq(99)
        end

        it "When the id provided is a string number" do
            character = Character.new("99")
            expect(character.id).to eq(99)
        end

        it "When the id provided isn't a number" do
            character = Character.new("string")
            expect(character.id).to eq(nil)
        end
    end

    describe "When check to a valid character" do
        let (:character) { Character.new }

        it "When the character id is valid" do
            character.id = 12
            expect(character.valid).to eq(true)
        end

        it "When the character is a invalid string" do
            character.id = "string"
            expect(character.valid).to eq(false)
        end

        it "When the character is a empty string" do
            character.id = ""
            expect(character.valid).to eq(false)
        end

        it "When the character is nil" do
            character.id = nil
            expect(character.valid).to eq(false)
        end
    end

    describe "When it's going to fetch the character data" do
        let (:character) { Character.new("12") }
        
        context "When the character is valid" do
            it "Return the character's data" do
                expect(character.fetch_character_data).not_to be_nil
            end
        end

        context "When the character is invalid" do
            it "Return nil" do
                character.id = "string"
                expect(character.fetch_character_data).to be_nil   
            end
        end

        context "When the character is a large number" do
            it "Return nil" do
                character.id = 12542345234
                expect(character.fetch_character_data).to be_nil   
            end
        end
    end
end