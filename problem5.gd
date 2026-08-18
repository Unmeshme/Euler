extends SceneTree

const MAX = 20
var primeArray = [2,3,5,7,11,13,17,19]
var nonPrimeArray = [1,4,6,8,9,10,12,14,15,16,18,20] #honestly no reason for this

func _init():
    var start = Time.get_unix_time_from_system()
    var solution = main() #yet to decide the calling convention
    var duration = Time.get_unix_time_from_system() - start

    print("Solution: %s, Duration: %.5f " %[solution, duration])
    quit()


func main()->int:
    return get_smallest_number()

func get_smallest_number()->int: 
    var smallest = 1
    for i in primeArray:
        var mul_factor = floor(log(20) / log(i))
        if mul_factor < 1:
            smallest *= i
        else:
            smallest *= pow(i, mul_factor)
    return smallest

