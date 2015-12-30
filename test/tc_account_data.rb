
require "test/unit"
require_relative '../lib/account_parser/account_data'

class TcData < Test::Unit::TestCase

  def test_account_data

    data_1 = AccountData.new "2011", "06", "12", "SB", "Descriptive Text 1", :debit , "1234.56"
    data_2 = AccountData.new "2012", "07", "13", "CB", "Descriptive Text 2", :credit, "2345.67"

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
    assert_equal data_2.prefix, "CB"
    assert_equal data_2.memo,   "Descriptive Text 2"
    assert_equal data_2.type,   :credit
    assert_equal data_2.value,  "2345.67"

  end

end