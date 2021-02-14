print("======= TASK 1 =======\n")

var array_of_five = Array(5...125)
array_of_five.dropFirst(5)
print("Deleted first 5 elems of array, new first elems - \(array_of_five[0]), \(array_of_five[1])")

var five_from_arr = Array(array_of_five.suffix(5))

print("Last 5 elems of arr\n")
for elem in five_from_arr{
    print("Element - \(elem)")
}

array_of_five.dropLast(5)
print("Dropped 5 elems. New size of array - \(array_of_five.count)\n")
array_of_five.append(array_of_five[0])
array_of_five.append(array_of_five[0])
print("Added 2 new elems. New size of array - \(array_of_five.count)\n")

print("Final array\n")
for (index , value) in array_of_five.enumerated() {
    print("Item \( index + 1 ) : \( value )")
}

print("\n======= TASK 2 =======\n")
print("\n======= TASK 3 =======\n")
print("\n======= TASK 4 =======\n")