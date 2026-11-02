#name score problem
extends SceneTree


func _init() -> void:
	var start_time = Time.get_unix_time_from_system()
	var solution = main("names.txt")
	var duration = Time.get_unix_time_from_system() - start_time

	print("Solution: %s , duration: %.5f" %[solution, duration])
	quit()


func load_file_data(p_path: String) -> PoolStringArray:
	var m_file: File = File.new()

	var m_error :int = m_file.open(p_path, File.READ)
	if m_error == OK:
		var m_content: String = m_file.get_as_text()
		m_content = m_content.replace('"',"")
		m_content = m_content.replace("\n", "")
		var m_content_array: PoolStringArray = m_content.split(",")
		m_file.close()
		return m_content_array
	else:
		print("Failed to open the file. Error code: ", m_error)
		return PoolStringArray([])


func main(p_path: String) -> int:
	var m_names: PoolStringArray = load_file_data(p_path)
	var m_name_position: int = 1
	var m_total: int = 0
	m_names.sort()
	#testing colin as given by the website
	print(m_names[937])
	for name in m_names:
		var m_val: int = 0
		for m_character in name:
			m_val += (ord(m_character) - 64)
		m_total += m_name_position * m_val
		m_name_position += 1
	return m_total
