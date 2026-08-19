extends SceneTree

const LIMIT = 100
func _init():
    var start = Time.get_unix_time_from_system()
    var solution = main() #idk the calling convention
    var duration = Time.get_unix_time_from_system() - start

    print("Solution: %s, duration: %.5f " %[solution, duration])
    quit()

func main()->int:
    return get_difference()


func get_difference()->int:
    var sum_of_squares = ((LIMIT) * (LIMIT + 1) * (2 * LIMIT + 1))/ 6
    var sum_n = (LIMIT * (LIMIT + 1)) / 2

    return sum_n * sum_n - sum_of_squares