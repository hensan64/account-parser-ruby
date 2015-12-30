
require "test/unit"
require_relative '../lib/account_parser/lib'
 
class TcLib < Test::Unit::TestCase
 
  def test_blank?
    assert_equal true, Lib.blank?(" \n")
    assert_equal true, Lib.blank?("\n")
  end
 
  def test_format_description
    assert_equal " a b c d e ", Lib.format_description("   a,b ,c    d,e ")
  end

  def test_format_value
    assert_equal "1234.56", Lib.format_value("1.234,56")
    assert_equal "1234.56", Lib.format_value("1 234,56")
  end

  def test_append_data
    hash_1 = {year: "2011", month: "06", day: "12", prefix: "SB", description: "Descriptive Text 1", type: :debit , value: "1234.56"}
    hash_2 = {year: "2012", month: "07", day: "13", prefix: "CB", description: "Descriptive Text 2", type: :credit, value: "2345.67"}

    data_1 = []
    data_2 = Lib.append_data data_1, "2011", "06", "12", "SB", "Descriptive Text 1", :debit , "1234.56"
    data_3 = Lib.append_data data_2, "2012", "07", "13", "CB", "Descriptive Text 2", :credit, "2345.67"
    
    assert_equal [hash_1]        , data_2
    assert_equal [hash_1, hash_2], data_3
  end

end