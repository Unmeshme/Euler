extends SceneTree

func _init():
    var start_time = Time.get_unix_time_from_system()
    var solution = main(1000)
    var total_time = Time.get_unix_time_from_system() - start_time

    print("Solution: %s, Duration: %.5f " %[solution, total_time])
    quit()

func main(p_lim: int) -> int:
    return Multiple(p_lim)


func Multiple(p_lim: int) -> int:
    var m_total = 0
    for i in range(3, p_lim):
        if i % 3 == 0 || i % 5 == 0:
            m_total += i
    return m_total