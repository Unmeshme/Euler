extends SceneTree
const FIBO_LIMIT = 4000000

func _init():
    var start = Time.get_unix_time_from_system()
    var solution = main() #yet to decide the footprint
    var duration = Time.get_unix_time_from_system() - start

    print("Solution: %s, duration: %.5f " %[solution, duration])
    quit()


func main() -> int:
    return get_Sum_of_Even_fib()


func get_Sum_of_Even_fib() -> int:
    var m_first = 1
    var m_second = 2
    var m_total = m_second

    while m_second < FIBO_LIMIT:
        var m_new = m_first + m_second
        if m_new & 1 == 0: #condition for even
            m_total += m_new
        m_first = m_second
        m_second = m_new

    return m_total
