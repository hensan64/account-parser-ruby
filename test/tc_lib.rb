
require "test/unit"
require_relative '../lib/account_parser/lib'
 
class TcLib < Test::Unit::TestCase
 
  def test_blank?
    assert_equal true, Lib.blank?(" \n")
    assert_equal true, Lib.blank?("\n")
  end
 
  def test_format_memo
    assert_equal " a b c d e ", Lib.format_memo("   a,b ,c    d,e ")
  end

  def test_format_value
    assert_equal "1234.56", Lib.format_value("1.234,56")
    assert_equal "1234.56", Lib.format_value("1 234,56")
  end

end