extends SceneTree

func _init():
    var start_time = Time.get_unix_time_from_system()
    var result = main()
    var duration = Time.get_unix_time_from_system() - start_time

    print("Solution: %s, Duration: %.5f" %[result, duration])
    quit()


func main()->int:
    return get_largest_palindrome()

func get_largest_palindrome()->int:
    var max_product = 999 * 999
    var found = false
    while !found:
        if check_palindrome(max_product) && check(max_product):
            #max_product is now an candidate
            found = true
            
        if !found:
            max_product -= 1

    return max_product

func check_palindrome(a: int)->bool:
    var copy = a
    var reversed = 0

    while copy:
        var remainder = copy % 10
        reversed = 10 * reversed + remainder
        copy = copy / 10
    if reversed == a:
        return true
    return false

func check(a : int)->bool:
    for i in range (100, 1000):
        if a % i == 0:
            var other = a / i
            if other > 99 && other < 1000:
                return true
    return false