let test_number: Int = 65
var test_double = 33.4
let test_double2: Double = 56.012
var test_string: String = "hello"
var test_string2 = "hello again"
let test_float: Float = 3.14;
let test_bool: Bool = false
var test_bool2 = true

print("======= TASK 1 =======\n")


print("test_number(let) - \(test_number) --- \(type(of: test_number))")
print("test_double(var) - \(test_double) --- \(type(of: test_double))")
print("test_double2(let) - \(test_double2) --- \(type(of: test_double2))")
print("test_string(var) - \(test_string) --- \(type(of: test_string))")
print("test_string(var) - \(test_string2) --- \(type(of: test_string2))")
print("test_float(let) - \(test_float) --- \(type(of: test_float))")
print("test_bool(let) - \(test_bool) --- \(type(of: test_bool))")
print("test_bool2(var) - \(test_bool2) --- \(type(of: test_bool2))")

var int_range = Int.min
print("\nMin int - \(int_range)")
int_range = Int.max
print("Max int - \(int_range)")

print("\n======= TASK 2 =======\n")


let decimalInteger = 5
let binaryInteger = 0b101 
let hexadecimalInteger = 0x5
let exponentNumber = 0.36e1
let formatNumber = 12_305_670.9_805

print("exponentNumber - \(exponentNumber)")


print("\n======= TASK 3 =======\n")


typealias Text = String

let text1: Text = "123"
let text2: Text = "456"
let text3: Text = "78abc"

if Int(text1) != nil { print("This is a number - \(text1)") }
else { print("This is not a number - \(text1)") }

if Int(text2) != nil { print("This is a number - \(text2)") }
else { print("This is not a number - \(text2)") }

if Int(text3) != nil { print("This is a number - \(text3)") }
else { print("This is not a number - \(text3)") }

var test_tuple = (year: 2019, faculty: "FIT", course: 4)
print("Tuple elements by name: \(test_tuple.year) --- \(test_tuple.faculty) --- \(test_tuple.course)")
print("Tuple elements by index: \(test_tuple.1) --- \(test_tuple.0) --- \(test_tuple.2)\n")

test_tuple.0 = 2021
test_tuple.1 = "SOMS"
test_tuple.2 = 3

let (year, faculty, course) = test_tuple
print("Constants:\nyear - \(year)\nfaculty - \(faculty)\ncourse - \(course)\n") 

let copy_tuple : (Int, String, Int) = test_tuple
print("Copy_tuple values:\n\(copy_tuple.0)\n\(copy_tuple.1)\n\(copy_tuple.2)\n")

print("\n======= TASK 4 =======\n")
print("\n======= TASK 5 =======\n")
print("\n======= TASK 6 =======\n")
print("\n======= TASK 7 =======\n")
print("\n======= TASK 8 =======\n")
print("\n======= TASK 9 =======\n")
print("\n======= TASK 10 =======\n")