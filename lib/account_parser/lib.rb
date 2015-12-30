# Common library

module Lib

  def self.blank?(line)
    if /^\s*$/ =~ line then true
    else false
    end
  end

  def self.format_memo(string)
    string.gsub!(/,/, " ")
    string.gsub!(/\s{2,}/, " ")
    string
  end

  def self.format_value(string)
    string.gsub!(/[.\s]/, "")
    string.gsub!(/,/, ".")
    string
  end

end