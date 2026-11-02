extends SceneTree

#implementation idea is that mostly, big int should be used to calculate the factorial and then we can sum through that list but this process might be slow
# what we learned is that, n! above 5 is always a multiple of 9 and a factor k.
# so 100! should be equal to similar prejurice and also another we can know is that sum of digits of 9! = sum of digits of 10!
# can we use that anywhere?
# sum_digit(99!) = sum_digit(100!)
# if sum_digit(99!) = [9 * k1] then sum_digit(100!) = [9 * k2]



const FACTORIAL_NUMBER = 100
var digits: Array = [1]

func _init() -> void:
	var start_time = Time.get_unix_time_from_system()
	var solution = main()
	var duration = Time.get_unix_time_from_system() - start_time

	print("Solution: %s and duration: %.5f " %[solution, duration])
	quit()


func main() -> int:
	return sum_of_digit_of_nth_factorial(FACTORIAL_NUMBER)


func sum_of_digit_of_nth_factorial(p_number: int) -> int:
	var m_start : int = 1
	#i is the multiplication factor
	for i in range(2, p_number + 1):
		var carry: int = 0
		for j in range (digits.size()):
			var val : int = digits[j] * i + carry
			digits[j] = val % 10
			carry = val / 10

		while carry > 0:
			digits.append(carry % 10)
			carry /= 10
	var total: int = 0
	for i in digits:
		total += i


	return total
