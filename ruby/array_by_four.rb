to_print = []
(1..16).each do |i|
  to_print << i
  if i % 4 == 0
    puts to_print.inspect
    to_print = []
  end
end

(1..16).each_slice(4) { |slice| puts slice.inspect }
