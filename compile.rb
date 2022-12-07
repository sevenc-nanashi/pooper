# frozen_string_literal: true

loop do
  code = File.read("compressed.rb").gsub(/\s/, "")
  emoji = File.read("./emoji.txt").gsub(/[,.*]/, " ")
  i = -1
  formatted = (
         emoji.gsub(/[^\s]/) do |c|
           i += 1
           code[i] || c
         end
       )
  puts formatted
  if i == code.length - 1
    puts "Matched!"
    File.write("formatted.rb", formatted)
    break
  else
    puts "Not matched: #{i} != #{code.length - 1}"
  end
  sleep 1
end
