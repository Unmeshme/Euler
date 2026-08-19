#finding the m_largest prime factor of any p_number

extends SceneTree

func _init():
    var start_time = Time.get_unix_time_from_system()
    var result = main(600851475143)

    var duration = Time.get_unix_time_from_system() - start_time
    print("Solution: %s, Duration: %.5f " %[result, duration])
    quit()


func main(p_number: int)->int:
    return get_largest_prime_factor(p_number)


func get_largest_prime_factor(p_number: int) ->int :
    var m_current = 3
    var m_largest = 3

    var m_found = false
    while !m_found:
        if p_number % m_current == 0:
            #divisible by the m_current prime
            m_largest = m_current
            p_number /= m_current
            if p_number < m_current:
                m_found = true
        else:
            m_current = get_next_prime(m_current)
    
    return m_largest


func is_prime(p_c: int)->bool:
    if p_c <= 1:
        return false
    if p_c <=3:
        return true
    if p_c % 2 == 0 || p_c % 3 == 0:
        return false
    
    var m_i = 5
    while m_i * m_i <= p_c:
        if p_c % m_i == 0 || p_c % (m_i+2) == 0:
            return false
        m_i += 6
    return true


func get_next_prime(p_c: int)-> int:
    if p_c < 2:
        return 2
    var m_can = p_c + 2

    while true:
        if is_prime(m_can):
            return m_can
        m_can += 2
    #return statement because godot was complaining
    return m_can
    

