class Ability
    attr_accessor :id, :name, :description

    @@idCounter = 1

    def initialize(name, description)
        @id = @@idCounter
        @@idCounter += 1

        @name = name
        @description = description
    end
end
