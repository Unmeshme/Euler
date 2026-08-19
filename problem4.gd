extends SceneTree

func _init():
    var start_time = Time.get_unix_time_from_system()
    var result = main()
    var duration = Time.get_unix_time_from_system() - start_time

    print("Solution: %s, Duration: %.5f" %[result, duration])
    quit()


func main()->int:
    return get_largest_palindrome()


func get_largest_palindrome()->int:
    var m_max_product = 999 * 999
    var m_found = false
    while !m_found:
        if check_palindrome(m_max_product) && check(m_max_product):
            #m_max_product is now an candidate
            m_found = true
            
        if !m_found:
            m_max_product -= 1

    return m_max_product


func check_palindrome(p_a: int)->bool:
    var m_copy = p_a
    var m_reversed = 0

    while m_copy:
        var m_remainder = m_copy % 10
        m_reversed = 10 * m_reversed + m_remainder
        m_copy = m_copy / 10
    if m_reversed == p_a:
        return true
    return false


func check(p_a : int)->bool:
    for i in range (100, 1000):
        if p_a % i == 0:
            var m_other = p_a / i
            if m_other > 99 && m_other < 1000:
                return true
    return false