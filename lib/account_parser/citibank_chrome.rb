# encoding: ascii-8bit

# Citibank Chrome parser

require_relative 'account_data'
require_relative 'lib'

module CitibankChrome

  def self.parse(lines, prefix)
    data_list = []
    lines.each {|line|
      next if Lib.blank?(line)
      /^.+?\t(?<day>\d{2})\/(?<month>\d{2})\/(?<year>\d{4})(?:\t.*?){2}\t(?<memo>.+?)(?:\t.*?){5}\t(?<sign>-?)(?<value>.+?)$/ =~ line
      if Regexp.last_match == nil then throw "ERROR: Line did not match regexp: " + line end
      type =
      case sign
      when "-" then :credit
      else :debit
      end
      data_list += [ AccountData.new(year.to_s, month.to_s, day.to_s, prefix.to_s, Lib.format_memo(memo.to_s), type, Lib.format_value(value.to_s)) ]
    }
    data_list
  end

end
