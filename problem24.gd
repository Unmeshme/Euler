extends SceneTree

#extending the test condition to just accept the correct solution
#test version finding the 14th permutation of string "abcd"
const NTH: int = 1000000
var test_k: int = NTH - 1
var test_choices: String = "0123456789"

func _init() -> void:
	var start_time = Time.get_unix_time_from_system()
	var solution = main()
	var duration = start_time - Time.get_unix_time_from_system()

	print("solution: %s and duration: %.5f" %[solution, duration])
	quit()


func main() -> String:
	return get_correct_factorial()

func get_correct_factorial() -> String:
	var r: Array = []
	r.resize(10) #four elements 0,1,2,3

	for i in range (r.size()):
		r[i] = test_k % (i+1)
		test_k /= (i+1)

	var solution_string: String = ""
	for i in range (r.size() - 1, -1, -1):
		solution_string += test_choices[r[i]]
		test_choices = test_choices.substr(0, r[i]) + test_choices.substr(r[i] + 1)

	print(solution_string)
	return solution_string
