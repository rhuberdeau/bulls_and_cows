require 'rails_helper'

RSpec.describe Compare, type: :model do
  describe '#call' do
    describe "when there is one direct match" do
      it "returns 1 bull" do
        result = Compare.call("foo", "far")
        expect(result).to eq({bulls: 1, cows: 0})
      end

      describe "and one indirect match" do
        it "returns 1 bull and 1 cow" do
          result = Compare.call("slide", "sxxex")
          expect(result).to eq({bulls: 1, cows: 1})
        end
      end
    end
    describe "when there are two direct matches" do
      it "returns 2 bulls" do
        result = Compare.call("slows", "slide")
        expect(result).to eq({bulls: 2, cows: 0})
      end

      describe "and two indirect matches" do
        it "returns 2 bulls and 2 cows" do
          result = Compare.call("slow", "slwo")
          expect(result).to eq({bulls: 2, cows: 2})
        end
      end
    end
  end
end
