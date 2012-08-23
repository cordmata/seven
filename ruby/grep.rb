File.open(ARGV[1],'r') do |f|
  line_no = 0
  while line = f.gets
    line_no += 1
    puts "#{line_no}: #{line}\n" if /#{ARGV[0]}/ =~ line
  end
end
