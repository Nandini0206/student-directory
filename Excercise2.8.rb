def print_code
  file = file.open( , "r")
  file.readlines.each do |line|
    puts readline
  end
  file.close
end

print_code
