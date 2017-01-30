require 'spec_helper'
require_relative '../src/model/Type'

RSpec.describe Type, "$ToString" do
    context "with single types" do
        it "returns the expected string" do
            expect(Type::ToString(Type::NORMAL)).to eq "Normal"
            expect(Type::ToString(Type::FIRE)).to eq "Fire"
            expect(Type::ToString(Type::WATER)).to eq "Water"
            expect(Type::ToString(Type::ELECTRIC)).to eq "Electric"
            expect(Type::ToString(Type::GRASS)).to eq "Grass"
            expect(Type::ToString(Type::ICE)).to eq "Ice"
            expect(Type::ToString(Type::FIGHTING)).to eq "Fighting"
            expect(Type::ToString(Type::POISON)).to eq "Poison"
            expect(Type::ToString(Type::GROUND)).to eq "Ground"
            expect(Type::ToString(Type::FLYING)).to eq "Flying"
            expect(Type::ToString(Type::PSYCHIC)).to eq "Psychic"
            expect(Type::ToString(Type::BUG)).to eq "Bug"
            expect(Type::ToString(Type::ROCK)).to eq "Rock"
            expect(Type::ToString(Type::GHOST)).to eq "Ghost"
            expect(Type::ToString(Type::DRAGON)).to eq "Dragon"
            expect(Type::ToString(Type::DARK)).to eq "Dark"
            expect(Type::ToString(Type::STEEL)).to eq "Steel"
            expect(Type::ToString(Type::FAIRY)).to eq "Fairy"
        end
    end

    context "with multiple types" do
        it "returns the expected string" do
            expect(Type::ToString(Type::NORMAL | Type::FIRE)).to eq "Normal / Fire"
            expect(Type::ToString(Type::GRASS | Type::POISON)).to eq "Grass / Poison"
        end
    end
end

RSpec.describe Type, "$FromString" do
    context "with single types" do
        it "returns the expected value" do
            expect(Type::FromString("Normal")).to eq Type::NORMAL
            expect(Type::FromString("Fire")).to eq Type::FIRE
            expect(Type::FromString("Water")).to eq Type::WATER
            expect(Type::FromString("Electric")).to eq Type::ELECTRIC
            expect(Type::FromString("Grass")).to eq Type::GRASS
            expect(Type::FromString("Ice")).to eq Type::ICE
            expect(Type::FromString("Fighting")).to eq Type::FIGHTING
            expect(Type::FromString("Poison")).to eq Type::POISON
            expect(Type::FromString("Ground")).to eq Type::GROUND
            expect(Type::FromString("Flying")).to eq Type::FLYING
            expect(Type::FromString("Psychic")).to eq Type::PSYCHIC
            expect(Type::FromString("Bug")).to eq Type::BUG
            expect(Type::FromString("Rock")).to eq Type::ROCK
            expect(Type::FromString("Ghost")).to eq Type::GHOST
            expect(Type::FromString("Dragon")).to eq Type::DRAGON
            expect(Type::FromString("Dark")).to eq Type::DARK
            expect(Type::FromString("Steel")).to eq Type::STEEL
            expect(Type::FromString("Fairy")).to eq Type::FAIRY
        end
    end

    context "with multiple types" do
        it "returns the expected value" do
            expect(Type::FromString("Normal / Fire")).to eq (Type::NORMAL | Type::FIRE)
            expect(Type::FromString("Grass / Poison")).to eq (Type::GRASS | Type::POISON)
        end
    end
end
