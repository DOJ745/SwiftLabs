print("======== TASK 1 ========\n")

enum MonthOfYear: String {

    case January = "January"
    case February = "February"
    case March = "March"
    case April = "April"
    case May = "May"
    case June = "June"
    case July = "July"
    case August = "August"
    case September = "September"
    case October = "October"
    case November = "November"
    case December = "December"

    func descriptionValue() -> MonthOfYear{ return self }
    func descriptionRawValue() -> String{ return self.rawValue }

    func Season() -> String {
        if(self.rawValue == "January" || self.rawValue == "December" || self.rawValue == "February"){
            return "It's Winter"
        }
        else if (self.rawValue == "April" || self.rawValue == "March" || self.rawValue == "May"){
            return "It's Spring"
        }
        else if (self.rawValue == "June" || self.rawValue == "July" || self.rawValue == "August"){
            return "It's Summer"
        }
        else{
            return "It's Autum"
        }    
    }
}

enum ArithmeticExpression {

    case number(Int)

    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case subtraction(ArithmeticExpression, ArithmeticExpression)
    indirect case multiply(ArithmeticExpression, ArithmeticExpression)
    indirect case division(ArithmeticExpression, ArithmeticExpression)
    indirect case power(ArithmeticExpression, ArithmeticExpression)

    func evaluate(expression: ArithmeticExpression? =  nil ) -> Int{
        
        let expression = (expression == nil ? self : expression)
        switch expression! {
        case .number( let value ):
            return value

        case .addition( let valueLeft, let valueRight ):
                return self.evaluate( expression: valueLeft ) + self.evaluate( expression: valueRight )

        case .subtraction( let valueLeft, let valueRight ):
            return self.evaluate( expression: valueLeft ) - self.evaluate( expression: valueRight )

        case .multiply ( let valueLeft, let valueRight ):
                return self.evaluate( expression: valueLeft ) * self.evaluate( expression: valueRight )

        case .division( let valueLeft, let valueRight ):
                return self.evaluate( expression: valueLeft ) / self.evaluate( expression: valueRight )

        case .power ( let valueLeft, let valueRight ):
                return self.evaluate( expression: valueLeft ) + self.evaluate( expression: valueRight )

        }
    }
}
var expr = ArithmeticExpression.addition( .number(20), .addition( .number(10), .number(30) ) )
print("Operation result - \(expr.evaluate())\n")

var myMonth = MonthOfYear.September 
print("Description value - \(type(of: myMonth.descriptionValue()) )")
print("Description RAW value - \(type(of: myMonth.descriptionRawValue())  )")
print("\(myMonth.Season())")


print("\n======== TASK 2 ========\n")

print("\n======== TASK 3 ========\n")