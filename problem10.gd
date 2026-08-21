extends SceneTree

const LIMIT = 2000000

func _init():
    var start = Time.get_unix_time_from_system()
    var solution = main(LIMIT)
    var duration = Time.get_unix_time_from_system() - start

    print("Solution: %s, Duration: %.5f " %[solution, duration])

    quit()



func main(p_limit:int)->int:
    return sum_of_primes(p_limit)


func sum_of_primes(p_limit:int) -> int:
    var m_is_prime: Array = []
    m_is_prime.resize(p_limit)
    m_is_prime.fill(1)

    m_is_prime[0] = 0
    m_is_prime[1] = 0

    var m_p = 2
    while m_p*m_p < p_limit:
        if m_is_prime[m_p] == 1:
            for i in range(m_p*m_p, p_limit, m_p):
                m_is_prime[i] = 0
        m_p +=1

    var m_total_sum:int = 0
    for i in range(2, p_limit):
        if m_is_prime[i] == 1:
            m_total_sum += i
    
    return m_total_sum