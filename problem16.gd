extends SceneTree





func _init() -> void:
    var start_time = Time.get_unix_time_from_system()
    var solution = main()
    var duration = Time.get_unix_time_from_system() - start_time

    print("Solution: %s , Duration: %.5f" %[solution, duration])
    quit()



func main() -> int:
    return get_solution(999)


func get_solution(p_limit: int) -> int:
	var m_solution :Array = [2]

	for m_i in range (p_limit):
		var m_carry: int = 0
		for m_j in range (m_solution.size()):
			var m_product: int = m_solution[m_j] * 2 + m_carry
			if m_product >= 10:
				var m_remainder = m_product % 10
				m_solution[m_j] = m_remainder
				m_carry = m_product / 10
			else:
				m_carry = 0
				m_solution[m_j] = m_product

		if m_carry:
			m_solution.append(m_carry)

	var m_sum_of_each_digits: int = 0

	for m_i in m_solution:
		m_sum_of_each_digits += m_i

	return m_sum_of_each_digits
