module Type
    NORMAL   = (1 << 0)
    FIRE     = (1 << 1)
    WATER    = (1 << 2)
    ELECTRIC = (1 << 3)
    GRASS    = (1 << 4)
    ICE      = (1 << 5)
    FIGHTING = (1 << 6)
    POISON   = (1 << 7)
    GROUND   = (1 << 8)
    FLYING   = (1 << 9)
    PSYCHIC  = (1 << 10)
    BUG      = (1 << 11)
    ROCK     = (1 << 12)
    GHOST    = (1 << 13)
    DRAGON   = (1 << 14)
    DARK     = (1 << 15)
    STEEL    = (1 << 16)
    FAIRY    = (1 << 17)

    IDENTIFIERS = [
        "Normal",
        "Fire",
        "Water",
        "Electric",
        "Grass",
        "Ice",
        "Fighting",
        "Poison",
        "Ground",
        "Flying",
        "Psychic",
        "Bug",
        "Rock",
        "Ghost",
        "Dragon",
        "Dark",
        "Steel",
        "Fairy"
    ]

    VALUES = [
        (1 << 0),
        (1 << 1),
        (1 << 2),
        (1 << 3),
        (1 << 4),
        (1 << 5),
        (1 << 6),
        (1 << 7),
        (1 << 8),
        (1 << 9),
        (1 << 10),
        (1 << 11),
        (1 << 12),
        (1 << 13),
        (1 << 14),
        (1 << 15),
        (1 << 16),
        (1 << 17)
    ]

    SPACELITERAL = " "
    SLASHLITERAL = "/"

    def FromString(value)
        result = 0
        value.strip.split(SPACELITERAL + SLASHLITERAL + SPACELITERAL).each do |val|
            result = result | VALUES[IDENTIFIERS.find_index(val)]
        end
        result
    end

    def ToString(type)
        result = String.new
        VALUES.zip(IDENTIFIERS).each do |value, name|
            if !(type & value).zero?
                result << SPACELITERAL << SLASHLITERAL << SPACELITERAL unless result.empty?
                result << name
            end
        end
        result
    end

    module_function :FromString, :ToString
end
