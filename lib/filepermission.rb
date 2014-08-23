require "filepermission/version"

module Filepermission
  def self.convert_to_octal(str)
    if str.length != 10
      raise
    end

    octal = Array.new(3)
    3.times do |i|
      octal[i] = 0
    end

    3.times do |i|
      3.times do |j|

        str_key = j + 1 + (3 * i)
        octal_key = (i % 3) + (i / 3)

        if str[str_key] == "r" then
          octal[octal_key] += 4
        end
        if str[str_key] == "w" then
          octal[octal_key] += 2
        end
        if str[str_key] == "x" then
          octal[octal_key] += 1
        end

      end
    end
    octal.join("").to_i
  end

  def self.convert_to_symbol(octal)
    sym = []
    3.times do |i|
      if octal.to_s[i] === "7" then
        sym << "rwx"
      elsif octal.to_s[i] === "6" then
        sym << "rw-"
      elsif octal.to_s[i] === "5" then
        sym << "r-x"
      elsif octal.to_s[i] === "4" then
        sym << "r--"
      elsif octal.to_s[i] === "3" then
        sym << "-wx"
      elsif octal.to_s[i] === "2" then
        sym << "-w-"
      elsif octal.to_s[i] === "1" then
        sym << "--x"
      elsif octal.to_s[i] === "0" then
        sym << "---"
      end
    end
    sym.join("")
  end
end
