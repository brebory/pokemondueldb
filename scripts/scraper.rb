#!/usr/bin/env ruby

require 'pathname'
require 'rubygems'
require 'nokogiri'
require 'sequel'
require_relative '../src/model/Ability'
require_relative '../src/model/Figure'
require_relative '../src/model/Move'
require_relative '../src/model/Type'

def parseFigure(document, moves, ability)
        infoTableHeader = document.css('.tab .fooleft b')[0]
        matches = infoTableHeader.text.match(/ID\-(?<ID>\d+)\s\-\s(?<Name>.+)/)
        name = matches["Name"] if matches
        id = matches["ID"] if matches

        infoTableBody = document.css('.fooinfo p')[0]
        puts infoTableBody.text

        matches = infoTableBody.text.match(/Movement:\s(?<MP>\n+)/)
        mp = matches["MP"] if matches

        matches = infoTableBody.text.match(/Rarity:\s(?<Rarity>\w)/)
        rarity = matches["Rarity"] if matches

        matches = infoTableBody.text.match(/Type:\s(?<Type>\w+(\s\/\s\w+)*)/)
        type = Type::FromString(matches["Type"]) if matches

        matches = infoTableBody.text.match(/Special\sAbility:\s(?<AbilityName>\w+(\s\w+)*)/)
        ability = matches["AbilityName"] if matches

        figure = Figure.new(id, name, mp, rarity, moves, type, ability)
        figure
end

def parseAbility(document)

end

def parseMoves(document)

end

if __FILE__ == $0
    Pathname.new("serebii").children.select do |file|
        file.basename.fnmatch("[0-9]*")
    end.each do |file|
        document = Nokogiri::HTML(open(file)) if file.exist?
        moves = parseMoves document
        ability = parseAbility document
        figure = parseFigure document, moves, ability
        puts figure
    end
end
