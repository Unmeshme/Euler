#finding the largest prime factor of any number

extends SceneTree

func _init():
    var start_time = Time.get_unix_time_from_system()
    var result = main(600851475143)

    var duration = Time.get_unix_time_from_system() - start_time
    print("Solution: %s, Duration: %.5f " %[result, duration])
    quit()


func main(number: int)->int:
    return get_largest_prime_factor(number)


func get_largest_prime_factor(number: int) ->int :
    var current = 3
    var largest = 3

    var found = false
    while !found:
        if number % current == 0:
            #divisible by the current prime
            largest = current
            number /= current
            if number < current:
                found = true
        else:
            current = get_next_prime(current)
    
    return largest

func is_prime(c: int)->bool:
    if c <= 1:
        return false
    if c <=3:
        return true
    if c % 2 == 0 || c % 3 == 0:
        return false
    
    var i = 5
    while i * i <= c:
        if c % i == 0 || c % (i+2) == 0:
            return false
        i += 6
    return true


func get_next_prime(c: int)-> int:
    if c < 2:
        return 2
    var can = c + 2

    while true:
        if is_prime(can):
            return can
        can += 2
    #return statement because godot was complaining
    return can
    

