require 'rails_helper'

RSpec.describe CountWordFrequencyService do
  describe "#call" do
    context "When the text has content" do
      let(:text) { "lumu lumu lumu lumu lumu illuminates illuminates attacks and adversaries lumu illuminates all attacks and adversaries" }

      it "Should return a true and a hash with the words and their frequency" do
        response = CountWordFrequencyService.new(text).()
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

    context "When the text is empty" do
      it "Should return false and an error message" do
        response = CountWordFrequencyService.new("").()
        expected = [
          false,
          "Lo sentimos, no se detectó ninguna palabra en el texto"
        ]

        expect(response).to match_array(expected)
      end
    end
  end
end
