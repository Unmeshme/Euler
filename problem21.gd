extends SceneTree


const LIMIT = 10000

#index and val
#array's index is the current number and value is the amicable pair lol so we just build a factor table and select any pair from it?
#lets just do bruteforce method
var num_list : Array
var amicable_pair: Dictionary

func _init() -> void:
	var start_time = Time.get_unix_time_from_system()
	var solution = main()
	var duration = Time.get_unix_time_from_system() - start_time

	print("Solution: %s and Duration: %.5f" %[solution, duration])
	quit()



func main() -> int:

	return get_amicable_pair_sum()


func get_amicable_pair_sum() -> int:
	fill_pair_array()
	get_all_amicable_pairs()
	var total: int = 0
	for keys in amicable_pair:
		print("Key: %s and Value: %s" %[keys, amicable_pair[keys]])
		total += (keys + amicable_pair[keys])

	return total



func fill_pair_array() -> void:
	num_list.resize(LIMIT+1)
	num_list.fill(0)
	num_list[1] = 1
	for i in range (2, LIMIT + 1):
		var sum_divisors: int = 0
		for j in range (1, i * 0.5 + 1):
			if j < 1:
				continue
			#optimize it later:
			#if i & 1 == 0: #even condition
				#j *= 2
			#else: #odd condition
				#j = 2*j - 1
			if i % j == 0: #why is this wrong though?
				sum_divisors += j
		num_list[i] = sum_divisors



func get_all_amicable_pairs() -> void:
	for i in range(LIMIT + 1):
		if num_list[i] > LIMIT:
			continue
		if num_list[num_list[i]] == i:
			if i < num_list[i]:
				amicable_pair[i] = num_list[i]
