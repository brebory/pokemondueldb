# A collection of script utilites

require 'logger'

module Utils

    Logger = Logger.new(STDOUT)

end

Utils::Logger.level = ENV["DEBUG"] ? Logger::DEBUG : Logger::INFO
