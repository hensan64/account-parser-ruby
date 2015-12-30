# Account data

# -----------
# Data format
# -----------
# year:   "2011"
# month:  "06"
# day:    "12"
# prefix: "SB"
# memo:   "Descriptive Text"
# type:   :debit | :credit
# value:  "1234.56"

class AccountData

  attr_reader :year, :month, :day, :prefix, :memo, :type, :value

  def initialize(year, month, day, prefix, memo, type, value)
    @year   = year
    @month  = month
    @day    = day
    @prefix = prefix
    @memo   = memo
    @type   = type
    @value  = value
  end

end