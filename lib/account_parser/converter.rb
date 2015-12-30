# Convert input to output file of type 'bank'

module Converter

  def self.execute(bank, in_path, out_path, prefix)
    in_file = File.open(in_path)
    out_file = File.new(out_path, "w")
    input = in_file.readlines
    data_list = bank.parse(input, prefix)  # Data hash: See Lib.append_data()
    write(data_list, out_file)
    in_file.close
    out_file.close
  end

  private

  def self.write(data_list, out_file)
    output = ["Date,Payee,Category,Memo,Outflow,Inflow"]
    data_list.each {|data|
      value =
      case data.type
      when :credit then "," + format_value(data)
      when :debit  then format_value(data) + ","
      end
      output +=
      [ data.year + "-" + data.month + "-" + data.day + "," + # Date
        "," +                                                 # Payee (not used)
        data.prefix + "," +                                   # Category
        data.memo + "," +                                     # Memo
        value ]                                               # Outflow + Inflow
    }
    out_file.puts(output)
  end

  def self.format_value(data)
    data.value.to_s
  end

end
