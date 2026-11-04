#1000 digit fibonacci number
#a approximation of a fibo number can be done with:
	# nth term = (((1+root(5))/2)^n)/root(5)
	# but this number is still too big
	# so we might have to manipulate it

extends SceneTree


const N = 1000


func _init() -> void:
	var start_time = Time.get_unix_time_from_system()
	var solution = main()
	var duration = Time.get_unix_time_from_system() - start_time

	print("Solution: %s, duration: %.5f" %[solution, duration])
	quit()



func main() -> float:
	return get_index()



#doing some log manipulation and conditions we find that, nth term >= 10^999
# final eqn becomes n >= (999 + log10(root(5)))/ log10((1+root(5))/2)

func get_index() -> float:
	var index: float = (999 + log10(sqrt(5)))/ (log10((1+sqrt(5))/2))
	return index

func log10(x: float) -> float:
	return log(x) / log(10)
