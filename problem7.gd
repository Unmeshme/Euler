extends SceneTree

#finding the nth prime number


func _init():
    var start = Time.get_unix_time_from_system()
    var solution = main()
    var duration = Time.get_unix_time_from_system() - start

    print("Solution: %s, Duration: %.5f " %[solution, duration])

    quit()


func main()->int:
    return get_nth_prime_number(10001)


func get_nth_prime_number(p_n: int)->int:
    var m_found_prime = 6
    #we can just start from a known prime number as high as we want, like for example the 6th prime is 13 given by the question
    var m_cur_number = 17
    while m_found_prime != p_n:
        if is_prime(m_cur_number): #true condition
            #increment the number by 2 and fpund by 1
            m_found_prime += 1
        m_cur_number += 2
    print("Found prime is: %d " %[m_found_prime])
    return m_cur_number - 2
        

func is_prime(p_num:int)->bool:
    if p_num <= 1:
        return false
    if p_num <=3:
        return true
    if p_num % 2 == 0 || p_num % 3 == 0:
        return false
    
    var m_i = 5
    while m_i * m_i <= p_num:
        if p_num % m_i == 0 || p_num % (m_i+2) == 0:
            return false
        m_i += 6
    return true