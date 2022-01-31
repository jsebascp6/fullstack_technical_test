require 'rails_helper'

RSpec.describe HashService do
  describe "#convert_hash_to_array_ordered" do
    context "When the hash has information" do
      let(:hash) { {"adversaries"=>"2", "all"=>"1", "and"=>"2", "attacks"=>"2", "illuminates"=>"3", "lumu"=>"6"} }

      it "Should return an array sorted from highest to lowest by the value" do
        response = HashService.convert_hash_to_array_ordered(hash)
        expected = [
          ["lumu", "6"],
          ["illuminates", "3"],
          ["adversaries", "2"],
          ["and", "2"],
          ["attacks", "2"],
          ["all", "1"]
        ]

        expect(response).to eq(expected)
      end
    end

    context "When the hash is empty" do
      it "Should return an empty array" do
        response = HashService.convert_hash_to_array_ordered({})

        expect(response).to be_empty
      end
    end
  end
end
