extends SceneTree

func _init() -> void:
	var start_time = Time.get_unix_time_from_system()
	var solution = main()
	var duration = Time.get_unix_time_from_system() - start_time

	print("Solution: %s, Duration: %.5f" %[solution, duration])

	quit()


func main() -> int:
	return get_solution()


#to find:- number of sundays starting from jan 1 1901 to december 30 2000
#we know jan 1 1900 was monday
# and september, april, june and november -> 30 days
# february -> 28 days but on leap year 29 days
# all months are of 31 days

func get_solution() -> int:
