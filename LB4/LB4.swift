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

var chessFigures: [String : (Character, Int)?] = [:]
chessFigures = ["Белая пешка" : ("A", 4), "Черный слон" : nil, "Белый король" : ("E", 2)]

var chessFiguresCoords: (Character, Int)?
for coords_values in chessFigures.values{

    if let chessFiguresCoords = coords_values{
        print("Chess figure have coords! It's coords - \(chessFiguresCoords)")
    }
    else { print("Figure is out of table") }
}

print("\n======= TASK 3 =======\n")

func sum(numbers: Double...) -> Double {
    var sum: Double = 0
    for elem in numbers {
        sum += elem
    }
    return sum
}
print("Sum of random doubles - \(sum(numbers: 40.15, 0.75, 1.23) )\n")

func average(numbers_avg: Double...) -> Double {
    var avg: Double = 0
    for elem in numbers_avg {
        avg += sum(numbers: elem)
    }
    avg = avg / Double(numbers_avg.count)
    return avg
}
print("Avgerage of numbers 5.133, 10.1, 76.5 - \(average(numbers_avg: 5.133, 10.1, 76.5))\n")

func argToNegative(_ arg: inout Double) -> () {
    arg = -arg
}
var test_arg = 55.0
print("Test arg before changin - \(test_arg)\n")
argToNegative(&test_arg)
print("Test arg after changing - \(test_arg)\n")

print("\n======= TASK 4 =======\n")