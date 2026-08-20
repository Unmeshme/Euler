extends SceneTree

func _init():
    var start = Time.get_unix_time_from_system()
    var solution = main()
    var duration = Time.get_unix_time_from_system() - start

    print("Solution: %s, Duration: %.5f" %[solution, duration])

    quit()


func main()->int:
    return calculate_py_triplets_product()


func calculate_py_triplets_product()->int:
    for m in range(2, 1000):
        for m_n in range (1, m):
            var m_pa = m*m - m_n * m_n
            var m_pb = 2*m*m_n
            var m_pc = m*m + m_n*m_n

            if check(m_pa, m_pb, m_pc):
                return m_pa*m_pb*m_pc
    
    return 0

func check(a:int, b:int, c:int)->bool:
    return (1000-(a+b) == c)