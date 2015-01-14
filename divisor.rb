def divisor a
	a.empty? ? [] : a.map { |val| divisor_sum(val) }.uniq
end


def divisor_sum a
	return 0 if (a <= 1 || a > 500000)
	(1..a-1).select { |val| a % val == 0 }.inject(:+)
end