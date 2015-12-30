
require "test/unit"
require_relative '../lib/account_parser/skandiabanken_chrome'
 
class TcSkandiabankenChrome < Test::Unit::TestCase
 
  def test_parse
    input  = [ "2011-06-12\tDescriptive Text 1\t-1234,56\t12345,67",
               "2012-07-13\tDescriptive Text 2\t2345,67\t23456,78" ]
    prefix = "SB"

    output = SkandiabankenChrome.parse input, prefix

    data_1 = output[0]
    data_2 = output[1]
    
    assert_equal data_1.year,   "2011"
    assert_equal data_1.month,  "06"
    assert_equal data_1.day,    "12"
    assert_equal data_1.prefix, "SB"
    assert_equal data_1.memo,   "Descriptive Text 1"
    assert_equal data_1.type,   :debit
    assert_equal data_1.value,  "1234.56"
    
    assert_equal data_2.year,   "2012"
    assert_equal data_2.month,  "07"
    assert_equal data_2.day,    "13"
    assert_equal data_2.prefix, "SB"
    assert_equal data_2.memo,   "Descriptive Text 2"
    assert_equal data_2.type,   :credit
    assert_equal data_2.value,  "2345.67"

  end
 
end