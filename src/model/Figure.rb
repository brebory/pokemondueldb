require_relative 'Type'

module Rarity
    COMMON = 0
    UNCOMMON = 1
    RARE = 2
    EX = 3

    IDENTIFIERS = [
        "C",
        "UC",
        "R",
        "EX"
    ]

    VALUES = [
        0,
        1,
        2,
        3
    ]

    def FromString(value)
        return IDENTIFIERS.find_index value
    end

    def ToString(rarity)
        return IDENTIFIERS[rarity]
    end

    module_function :FromString, :ToString
end

class Figure
    attr_accessor :id, :name, :mp, :rarity, :moves, :type, :ability
    def initialize(id, name, mp, rarity, moves, type, ability)
        @id = id
        @name = name
        @mp = mp
        @rarity = rarity
        @moves = moves ||= Array.new
        @type = type ||= Type.NORMAL
        @ability = ability
    end
end
