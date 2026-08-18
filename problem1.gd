extends SceneTree

func _init():
    var start_time = Time.get_unix_time_from_system()
    var solution = main(1000)
    var total_time = Time.get_unix_time_from_system() - start_time

    print("Solution: %s, Duration: %.5f " %[solution, total_time])
    quit()

func main(lim: int) -> int:
    return Multiple(lim)

func Multiple(lim: int) -> int:
    var total = 0
    for i in range(3, lim):
        if i % 3 == 0 || i % 5 == 0:
            total += i
    return total