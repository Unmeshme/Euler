extends SceneTree

#finding the nth prime number


func _init():
    var start = Time.get_unix_time_from_system()
    var solution = main()
    var duration = Time.get_unix_time_from_system() - start

    print("Solution: %s, Duration: %.5f " %[solution, duration])

    quit()


func main()->int:
    return get_nth_prime_number(10001)


func get_nth_prime_number(n: int)->int:
    var found_prime = 6
    #we can just start from a known prime number as high as we want, like for example the 6th prime is 13 given by the question
    var cur_number = 17
    while found_prime != n:
        if is_prime(cur_number): #true condition
            #increment the number by 2 and fpund by 1
            found_prime += 1
        cur_number += 2
    print("Found prime is: %d " %[found_prime])
    return cur_number - 2
        

func is_prime(num:int)->bool:
    if num <= 1:
        return false
    if num <=3:
        return true
    if num % 2 == 0 || num % 3 == 0:
        return false
    
    var i = 5
    while i * i <= num:
        if num % i == 0 || num % (i+2) == 0:
            return false
        i += 6
    return true