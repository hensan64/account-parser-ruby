
require "test/unit"
require_relative '../lib/account_parser/citibank_chrome'
require_relative '../lib/account_parser/converter'
require_relative '../lib/account_parser/skandiabanken_chrome'
 
class TcConverter < Test::Unit::TestCase
 
  def test_execute_citibank_chrome
    in_path      = "./files/in_citibank.txt"
    out_path     = "./files/Citibank.csv"
    out_ref_path = "./files/Citibank.ref.csv"
    prefix       = "CB"
    
    Converter.execute CitibankChrome, in_path, out_path, prefix

    out_file     = File.open(out_path)
    out_ref_file = File.open(out_ref_path)
    assert_equal out_ref_file.readlines, out_file.readlines
  end

  def test_execute_skandiabanken_chrome
    in_path      = "./files/in_skandiabanken.txt"
    out_path     = "./files/Skandiabanken.csv"
    out_ref_path = "./files/Skandiabanken.ref.csv"
    prefix       = "SB"
    
    Converter.execute SkandiabankenChrome, in_path, out_path, prefix

    out_file     = File.open(out_path)
    out_ref_file = File.open(out_ref_path)
    assert_equal out_ref_file.readlines, out_file.readlines
  end

end