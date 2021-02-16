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

func doWithTwo(doFunc: (Double...) -> Double, _ argOne: Double, _ argTwo: Double) -> Double {
    var result: Double
    result = doFunc(argOne, argTwo)
    return result
}

func defaultFunc(_ args: Double...) -> Double{
    return 0.0
}

print("doWithTwo - \(doWithTwo(doFunc: sum, 5.14, 8.16))\n")

func operation (which: String) -> ((Double...)-> Double) {
    if which == "sum" { print("sum() func"); return sum }
    else if which == "average" { print("average() func"); return average }
    else {
        print("No such operation\n")
        return defaultFunc
    }
}
var some_operation = operation(which: "sum") 
print("Result of 'operation()' - \(some_operation(3.0, 5.0))\n")

func doOperation(operation: String) -> ((Double, Double) -> Double)? {

    func simpleSum(_ argOne: Double, _ argTwo: Double) -> Double{
        return argOne + argTwo
    }
    func simpleMultiply(_ argOne: Double, _ argTwo: Double) -> Double{
       return argOne * argTwo 
    }
    func simpleDivision(_ argOne: Double, _ argTwo: Double) -> Double{
        return argOne / argTwo
    }
    func simpleSubtraction(_ argOne: Double, _ argTwo: Double) -> Double{
        return argOne - argTwo
    }

    switch operation {
        case "+":
            return simpleSum
        case "-":
            return simpleSubtraction
        case "*":
            return simpleMultiply
        case "/":
            return simpleDivision
        
        default: return nil
    }
}

var some_operationTwo: ((Double, Double) -> Double)?
if let some_operationTwo = doOperation(operation: "p"){
    print("Result of 'doOperation()' - \(some_operationTwo(4.0, 6.0))\n")
}
else { print("No such operation\n") }

print("\n======= TASK 4 =======\n")

var randomNumsArr: [Int] = [34, 12, 1, 0, 100, 745, 5]
randomNumsArr.sort(by: {$0 > $1} )
print("Arr sorted by desc - \(randomNumsArr)")
randomNumsArr.sort(by: {$0 < $1} )
print("Arr sorted by asc - \(randomNumsArr)")

randomNumsArr = [1, 2, 3, 10, 9, 50, 4]
var maxFromArr: Int = randomNumsArr.reduce(0) { (total, number) in max(total, number) }
print("Max elem of arr from reduce() - \(maxFromArr)")

var someMatrix = [[1,2,3], [34,56], [1,78,5]]
print("Current matrix - \(someMatrix)")
var filtedMatrix = someMatrix.flatMap{$0.filter{$0 % 1 == 0} }
print("Matrix to simple arr - \(filtedMatrix)")

