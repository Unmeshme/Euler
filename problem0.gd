extends SceneTree

func _init() :
    var start_time = Time.get_unix_time_from_system()
    var ans = main(152000/2)
    var duration = Time.get_unix_time_from_system() - start_time
    print("Answer: %s, Duration: %.5f " %[ans, duration])
    quit()


func main(p_lim: int) -> int:
    return Sum(p_lim)


func Sum(p_lim: int) -> int:
    return (4*p_lim*p_lim*p_lim - p_lim) / 3

