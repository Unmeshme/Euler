extends SceneTree


const MAX = 1000000

var cache: Dictionary = {1:1}



func _init() -> void:
	var start = Time.get_unix_time_from_system()
	var solution = main()
	var duration = Time.get_unix_time_from_system() - start

	print("Solution: %s, Duration: %.5f" %[solution, duration])

	quit()


func main() -> int:
	return get_longest_collartz()




func get_longest_collartz() -> int:
	#itereate and fill the sequence length and then at last iterate and find the one with longest value
	for i in range (2, MAX):
		find_squence_length(i)

	var m_max_key: int = 0
	var m_max_val: int = -INF

	for key in cache:
		if cache[key] > m_max_val:
			m_max_key = key
			m_max_val = cache[key]

	return m_max_key

#odd numbers have 1 as the last bit and has 1 as last bit in binary so; even number is not ( num & 1)
#problem is more related to space now

func find_squence_length(p_num: int) -> void:
	var m_copy: int = p_num
	var m_path: Array = []

	while not cache.has(m_copy):
		m_path.append(m_copy)
		if not (m_copy & 1):
			m_copy /= 2
		else:
			m_copy = m_copy * 3 + 1
	var m_curr_len: int = cache[m_copy]

	for i in range (m_path.size() - 1, -1, -1):
		m_curr_len += 1
		cache[m_path[i]] = m_curr_len
