
require "test/unit"
require_relative '../lib/account_parser/citibank_chrome'
 
class TcCitibankChrome < Test::Unit::TestCase
 
  def test_parse
    input  = [ "1\t12/06/2011\t13/07/2012\t1234567890123\tDescriptive Text 1\tAdditional Info 1\t\t1.234,56\tSEK\t\t1.234,56",
               "2\t13/07/2012\t14/08/2013\t2345678901234\tDescriptive Text 2\tAdditional Info 2\t\t-234,567\tUSD\tUSD = SEK 10.50\t-2.345,67" ]
    prefix = "CB"

    output = CitibankChrome.parse input, prefix
    
    data_1 = output[0]
    data_2 = output[1]
    
    assert_equal data_1.year,   "2011"
    assert_equal data_1.month,  "06"
    assert_equal data_1.day,    "12"
    assert_equal data_1.prefix, "CB"
    assert_equal data_1.memo,   "Descriptive Text 1"
    assert_equal data_1.type,   :debit
    assert_equal data_1.value,  "1234.56"
    
    assert_equal data_2.year,   "2012"
    assert_equal data_2.month,  "07"
    assert_equal data_2.day,    "13"
    assert_equal data_2.prefix, "CB"
    assert_equal data_2.memo,   "Descriptive Text 2"
    assert_equal data_2.type,   :credit
    assert_equal data_2.value,  "2345.67"

  end
 
end

