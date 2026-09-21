extends SceneTree


func _init() -> void:
	var start_time = Time.get_unix_time_from_system()
	var solution = main()
	var duration = Time.get_unix_time_from_system() - start_time

	print("Solution: %s, Duration: %.5f" %[solution, duration])
	quit()


func main() -> int:
	return get_solution()


func get_solution() -> int:
	var m_grid_size: int = 20
	var m_result: int = 1
	for m_i in range(1, m_grid_size + 1):
		m_result = ((m_result)*(m_grid_size + m_i)) / (m_i)
	return m_result
