print("======= TASK 1 =======\n")

var array_of_five = Array(5...125)
array_of_five.dropFirst(5)
print("Deleted first 5 elems of array, new first elems:")
for i in 0...4{
    print("Elem of arr - \(array_of_five[i])")
}

var five_from_arr = Array(array_of_five.suffix(5))

print("\nLast 5 elems of arr\n")
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
chessFigures = ["White pawn" : ("A", 4), "Black bishop" : nil, "White king" : ("E", 2)]

for chessValues in chessFigures{
    if let chessCoords = chessValues.value{
        print("Chess figure \(chessValues.key) on the table! It's coords - \(chessCoords)")
    }
    else { print("Figure \(chessValues.key) is out of table") }
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
else { print("No such operation in 'doOperation'\n") }

print("\n======= TASK 4 =======\n")

var randomNumsArr: [Int] = [34, 12, 1, 0, 100, 745, 5]
randomNumsArr.sort(by: {$0 > $1} )
print("Arr sorted by desc - \(randomNumsArr)")
randomNumsArr.sort(by: {$0 < $1} )
print("Arr sorted by asc - \(randomNumsArr)")
/*
var num_arr: [String] = ["12", "4", "54", "90", "89", "nb67"]
var edited_num_arr = num_arr
.compactMap{ Int($0) }
.map{ Array(String($0)) }
print("edited_num_arr - \(edited_num_arr)")
edited_num_arr.forEach{ print("RESULT - \($0.compactMap{ Int(String($0)) }.reduce(0, +)) ") }
*/
var num_arrTwo = [145, 45, 6, 99, nil]
var edited_num_arrTwo = num_arrTwo.map( { (elem : Int?) -> String in
    var sum = 0
    guard var num = elem else {
        return "nil"
    }
    while(num > 0){
        sum += num % 10
        num /= 10
    }
    return String(sum)
})
print("Basic num_arrTwo - \(num_arrTwo)")
print("Edited num_arrTwo - \(edited_num_arrTwo)")

randomNumsArr = [1, 2, 3, 10, 9, 50, 4]
var maxFromArr: Int = randomNumsArr.reduce(0) { (total, number) in max(total, number) }
print("Max elem of arr from reduce() - \(maxFromArr)")

var someMatrix = [[1, 2, 3], [34, 56], [1, 78, 5]]
print("Current matrix - \(someMatrix)")
var flatMatrix = someMatrix.flatMap{$0}
print("Matrix to simple arr - \(flatMatrix)")

