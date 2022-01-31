require 'rails_helper'

RSpec.describe ValidateFileAndCountWordsService do
  describe "#call" do
    context "When the file is of type .txt and has text" do
      let(:file) { File.open(Rails.root.join("spec/factories/files", "text.txt")) }

      it "Should return true and hash with the frequency of words" do
        response = ValidateFileAndCountWordsService.new(file).()
        expected = [
          true,
          {
            "lumu"        => 6,
            "illuminates" => 3,
            "attacks"     => 2,
            "and"         => 2,
            "adversaries" => 2,
            "all"         => 1
          }
        ]

        expect(response).to match_array(expected)
      end
    end

    context "When the file is not of type .txt" do
      let(:file) { File.open(Rails.root.join("spec/factories/files", "text.pdf")) }

      it "Should return false and an error message" do
        response = ValidateFileAndCountWordsService.new(file).()
        expected = [
          false,
          "Lo sentimos, el tipo de archivo no es compatible"
        ]

        expect(response).to match_array(expected)
      end
    end

    context "When the file is of type .txt but has no text" do
      let(:file) { File.open(Rails.root.join("spec/factories/files", "empty_text.txt")) }

      it "Should return false and an error message" do
        response = ValidateFileAndCountWordsService.new(file).()
        expected = [
          false,
          "Lo sentimos, no se detectó ninguna palabra en el texto"
        ]

        expect(response).to match_array(expected)
      end
    end
  end
end
