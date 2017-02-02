#!/usr/bin/env ruby

require 'pathname'
require 'rubygems'
require 'nokogiri'
require 'sequel'
require_relative '../src/model/Ability'
require_relative '../src/model/Figure'
require_relative '../src/model/Move'
require_relative '../src/model/Type'
require_relative 'utils'

module Cache

    Abilities = Hash.new

end


def mirrorSerebii
    system("wget -r -np -nd -R jpg,gif,png -P serebii http://serebii.net/duel/")
end

def parseFigure(document, moves)
    Utils::Logger.info("scraper") { "Parsing figure..." }

    infoTableHeader = document.css('.tab .fooleft b')[0]
    matches = infoTableHeader.text.match(/ID\-(?<ID>\d+)\s\-\s(?<Name>.+)/)
    name = matches["Name"] if matches
    id = matches["ID"] if matches

    infoTableBody = document.css('.fooinfo p')[0]

    matches = infoTableBody.text.match(/Movement:\s(?<MP>\n+)/)
    mp = matches["MP"] if matches

    matches = infoTableBody.text.match(/Rarity:\s(?<Rarity>\w)/)
    rarity = matches["Rarity"] if matches

    matches = infoTableBody.text.match(/Type:\s(?<Type>\w+(\s\/\s\w+)*)/)
    type = Type::FromString(matches["Type"]) if matches

    matches = infoTableBody.text.match(/Special\sAbility:\s(?<AbilityName>\w+(\s\w+)*)\s\-\s(?<AbilityText>.+)/)
    abilityName = matches["AbilityName"] if matches
    abilityText = matches["AbilityText"] if matches

    Utils::Logger.debug("scraper") { "AbilityName: #{abilityName} AbilityText: #{abilityText}"}

    ability = nil

    if abilityName
        unless Cache::Abilities.include? abilityName
            ability = Ability.new(abilityName, abilityText)
            Cache::Abilities[abilityName] = ability
        else
            ability = Cache::Abilities[abilityName]
        end
    end


    figure = Figure.new(id, name, mp, rarity, moves, type, ability)
    figure
end

def parseMoves(document)
    Utils::Logger.info("scraper") { "Parsing moves..." }


end

if __FILE__ == $0

    Utils::Logger.info("scraper") { "Starting scraper." }

    Utils::Logger.debug("scraper") { "Determining if serebii mirror exists." }

    serebii = Pathname.new("serebii")

    unless serebii.exist?
        Utils::Logger.debug("scraper") { "seribii mirror not found, scraping... "}

        mirrorSerebii
        serebii = Pathname.new("serebii")
    end

    unless serebii.exist?
        Utils::Logger.fatal("scraper") { "Unable to find serebii mirror, exiting..." }

        exit 1
    end

    Utils::Logger.info("scraper") { "Parsing files in diretory \'serebii\'." }

    serebii.children.select do |file|
        file.basename.fnmatch("[0-9]*")
    end.each do |file|
        Utils::Logger.info("scraper") { "Creating Nokogiri document from #{file.basename}" }

        document = Nokogiri::HTML(open(file)) if file.exist?
        moves = parseMoves document
        figure = parseFigure document, moves

        Utils::Logger.info("scraper") { figure }
    end
end
