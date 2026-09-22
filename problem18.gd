extends SceneTree


var problem_array: Array = [
							[75],
							[95,64],
							[17,47,82],
							[18,35,87,10],
							[20,04,82,47,65],
							[19,01,23,75,03,34],
							[88,02,77,73,07,63,67],
							[99,65,04,28,06,16,70,92],
							[41,41,26,56,83,40,80,70,33],
							[41,48,72,33,47,32,37,16,94,29],
							[53,71,44,65,25,43,91,52,97,51,14],
							[70,11,33,28,77,73,17,78,39,68,17,57],
							[91,71,52,38,17,14,91,43,58,50,27,29,48],
							[63,66,04,68,89,53,67,30,73,16,69,87,40,31],
							[04,62,98,27,23,09,70,98,73,93,38,53,60,04,23]
							]


func _init() -> void:
	var start_time = Time.get_unix_time_from_system()
	var solution = main()
	var duration = Time.get_unix_time_from_system() - start_time

	print("Solution: %s, Duration: %.5f" %[solution, duration])
	quit()


func main() -> int:
	return get_solution()


func get_solution() -> int:
	for m_i in range(problem_array.size() - 1, 0, -1):
		for m_j in range(problem_array[m_i - 1].size()):
			var m_max: int = max(problem_array[m_i][m_j], problem_array[m_i][m_j + 1])
			problem_array[m_i - 1][m_j] += m_max

	return problem_array[0][0]
