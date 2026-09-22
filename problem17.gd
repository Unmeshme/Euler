extends SceneTree

#honesly we only care about the length and not the actual numbers
var ones: Array = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
var unique_ones: Array = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
var tens: Array = ["twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
var hundreds: Array = ["onehundred", "twohundred", "threehundred", "fourhundred", "fivehundred", "sixhundred", "sevenhundred", "eighthundred", "ninehundred",]
var thousands: String = "onethousand"

func _init() -> void:
	var start_time = Time.get_unix_time_from_system()
	var solution = main()
	var duration = Time.get_unix_time_from_system() - start_time

	print("Solution: %s, Duration: %.5f" %[solution, duration])
	quit()


func main() -> int:
	return get_solution()



func get_solution() -> int:
	var m_count: int = thousands.length()
	var m_sum_100: int = get_upto_hundred()


	m_count += m_sum_100

	for m_hundred in hundreds:
		m_count += 100 * m_hundred.length() + 99 * 3 + m_sum_100

	return m_count

func get_upto_hundred() -> int:
	var m_sum_digit_upto_hundred: int = 0
	#1-9
	for m_ones in ones:
		m_sum_digit_upto_hundred += m_ones.length()
	#11-19
	for m_unique_ones in unique_ones:
		m_sum_digit_upto_hundred += m_unique_ones.length()
	#now combine and do it

	#20-99
	for m_tens in tens:
		var m_tens_len: int = m_tens.length()
		m_sum_digit_upto_hundred += m_tens_len
		for m_ones in ones:
			m_sum_digit_upto_hundred += m_tens_len + m_ones.length()
	print("sum till 100: %s", [m_sum_digit_upto_hundred])
	return m_sum_digit_upto_hundred
