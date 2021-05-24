#create a file, write some text
puts 'Enter file name:'
file_name = gets.chomp
puts 'Enter some text which will be written to your file:'
file_text = gets.chomp
my_file = File.open(file_name, 'w') do |f|
  f.write(file_text)
end

# read text
puts 'Do you want to read text from your file? Y/N'
read_file_answer = gets.chomp.upcase!
case read_file_answer
when 'Y'

  puts 'The content of your file:'
  my_file = File.open(file_name, 'r') { |f|
    f.each_line { |line| puts line }
  }
when 'N'
  puts 'Thank you for the answer!'
else
  puts 'Error! Your answer should be Y/N'
end

# close file
puts 'Do you want to close your file? Y/N'
close_file_answer = gets.chomp.upcase!
case close_file_answer
when 'Y'
  my_file.close
  if my_file.closed?
    puts "File #{file_name} was closed successfully"
  else
    puts "File #{file_name} hasn't been closed!"
  end
when 'N'
  puts 'Thank you for the answer!'
end

# delete file
puts 'Do you want to delete your file? Y/N'
delete_file_answer = gets.chomp.upcase!
case delete_file_answer
when 'Y'
  File.delete(my_file)
  if !File.exist?(file_name)
    puts "File #{file_name} was deleted successfully"
  else
    puts "File #{file_name} hasn't been deleted!"
  end
when 'N'
  puts "Thank you for the answer! File #{file_name} hasn't been deleted!"
else
  puts 'Error! Your answer should be Y/N'
end