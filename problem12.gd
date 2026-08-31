extends SceneTree

func _init() -> void:
	var start_time = Time.get_unix_time_from_system()
	var solution = main()
	var duration = Time.get_unix_time_from_system() - start_time

	print("Solution: %s and Duration: %.5f " %[solution, duration])

	quit()


func main() -> int:
	return get_correct()


func get_correct() -> int:

	var m_n: int = 1

	while true:
		var m_a: int
		var m_b: int

		if m_n % 2 == 0:
			m_a = m_n / 2
			m_b = (m_n+1)
		else:
			m_a = m_n
			m_b = (m_n+1) / 2

		var m_factors: int = calc_tau(m_a) * calc_tau(m_b)

		if m_factors >= 500:
			return m_a * m_b

		m_n += 1

	return 0

func calc_tau(p_num: int) -> int:
	var m_tau: int = 1
	var m_factor: int = 2

	while m_factor * m_factor <= p_num:
		var m_exponent: int = 0

		while p_num % factor == 0:
			p_num /= factor
			m_exponent += 1

		if m_exponent > 0:
			m_tau *= m_exponent + 1

		m_factor += 1

	if p_num > 1:
		m_tau *= 2

	return m_tau
