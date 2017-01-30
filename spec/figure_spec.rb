require 'spec_helper'
require_relative '../src/model/Figure'

RSpec.describe Rarity, "$ToString" do
    it "returns the expected string" do
        expect(Rarity::ToString(Rarity::COMMON)).to eq "C"
        expect(Rarity::ToString(Rarity::UNCOMMON)).to eq "UC"
        expect(Rarity::ToString(Rarity::RARE)).to eq "R"
        expect(Rarity::ToString(Rarity::EX)).to eq "EX"
    end
end

RSpec.describe Rarity, "$FromString" do
    it "returns the expected value" do
        expect(Rarity::FromString("C")).to eq Rarity::COMMON
        expect(Rarity::FromString("UC")).to eq Rarity::UNCOMMON
        expect(Rarity::FromString("R")).to eq Rarity::RARE
        expect(Rarity::FromString("EX")).to eq Rarity::EX
    end
end
