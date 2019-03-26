def print_code
  file = file.open( $0 , "r")
  file.readlines.each do |line|
    puts readline
  end
  file.close
end

print_code
