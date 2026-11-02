extends SceneTree

var div_sum: PoolIntArray = []
var abundant_num: PoolIntArray = []
var can_be_expressed: PoolByteArray = []

const UPPER_LIMIT = 28123



func _init() -> void:
	var start_time = Time.get_unix_time_from_system()
	var solution = main()
	var duration = Time.get_unix_time_from_system() - start_time

	print("Solution: %s, duration: %.5f" %[solution, duration])
	quit()


func create_divisors_sum()-> void:
	div_sum.resize(UPPER_LIMIT + 1)
	div_sum.fill(0)
	can_be_expressed.resize(UPPER_LIMIT + 1)
	can_be_expressed.fill(0)
	div_sum[0] = 0

	for i in range (1, int(UPPER_LIMIT / 2) + 1):
		for j in range(2*i, UPPER_LIMIT + 1, i):
			div_sum[j] += i


func main() -> int:
	create_divisors_sum()
	for i in range(1, UPPER_LIMIT + 1):
		if div_sum[i] > i:
			abundant_num.append(i)

	var m_abundant_max: int = abundant_num.size()
	for i in range(m_abundant_max):
		for j in range(i, m_abundant_max):
			var s = abundant_num[i] + abundant_num[j]
			if s > UPPER_LIMIT:
				break
			else:
				can_be_expressed[s] = 1

	var total: int = 0
	for i in range (1, UPPER_LIMIT + 1):
		if can_be_expressed[i] == 0:
			total += i

	return total
