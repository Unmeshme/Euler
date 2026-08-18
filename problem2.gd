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
    var first = 1
    var second = 2
    var total = second

    while second < FIBO_LIMIT:
        var new = first + second
        if new & 1 == 0: #condition for even
            total += new
        first = second
        second = new

    return total
