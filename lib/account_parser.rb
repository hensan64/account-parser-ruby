# Main script

require_relative "account_parser/citibank_chrome"
require_relative "account_parser/converter"
require_relative "account_parser/skandiabanken_chrome"

# Execute

case ARGV[0]
when "citibank"      then Converter.execute CitibankChrome     , "../files/in_citibank.txt"     , "../files/Citibank.csv"     , "CB"
when "skandiabanken" then Converter.execute SkandiabankenChrome, "../files/in_skandiabanken.txt", "../files/Skandiabanken.csv", "SB"
end
