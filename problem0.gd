extends SceneTree

func _init() :
    var start_time = Time.get_unix_time_from_system()
    var ans = main(152000/2)
    var duration = Time.get_unix_time_from_system() - start_time
    print("Answer: %s, Duration: %.5f " %[ans, duration])
    quit()


func main(lim: int) -> int:
    return Sum(lim)

func Sum(lim: int) -> int:
    return (4*lim*lim*lim - lim) / 3

