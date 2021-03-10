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

/*
enum ArithmeticExpression {
    case addition (Double, Double)
    case substraction (Double, Double)
    case multiply (Double, Double)
    case division (Double, Double)
    case power (Double, Double)
    
    func evaluate() -> Double {
        switch self{
        case .addition(let left, let right):
            return left + right
        case .substraction(let left,let right):
            return left - right
        case .multiply(let left, let right):
            return left * right
        case .division(let left, let right):
            return left / right
        case .power(let left, let right):
            return pow(left, right)
        }
    }
}*/

enum ArithmeticExpression {

    case number(Double)

    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case subtraction(ArithmeticExpression, ArithmeticExpression)
    indirect case multiply(ArithmeticExpression, ArithmeticExpression)
    indirect case division(ArithmeticExpression, ArithmeticExpression)
    indirect case power(ArithmeticExpression, ArithmeticExpression)

    func evaluate(expression: ArithmeticExpression? =  nil ) -> Double {
        
        let expression = (expression == nil ? self : expression)
        switch expression! {
        case .number(let value):
            return value

        case .addition(let valueLeft, let valueRight):
                return self.evaluate(expression: valueLeft) + self.evaluate(expression: valueRight)

        case .subtraction(let valueLeft, let valueRight):
            return self.evaluate(expression: valueLeft) - self.evaluate(expression: valueRight)

        case .multiply (let valueLeft, let valueRight):
                return self.evaluate(expression: valueLeft) * self.evaluate(expression: valueRight)

        case .division(let valueLeft, let valueRight):
                return self.evaluate(expression: valueLeft) / self.evaluate(expression: valueRight)

        case .power (let valueLeft, let valueRight):
            return (self.evaluate(expression: valueLeft) * self.evaluate(expression: valueRight))

        }
    }
}
 
var expr = ArithmeticExpression.power(.number(4), .addition(.number(1), .number(2)))
print("Operation result - \(expr.evaluate())\n")

var myMonth = MonthOfYear.September
print("Description value - \( type(of: myMonth.descriptionValue()) )")
print("Description RAW value - \( type(of: myMonth.descriptionRawValue()) )")
print("\(myMonth.Season())")


print("\n======== TASK 2 ========\n")

    
enum Status {
    case Open
    case Closed
    case Resolved
    case Reopened
    case In_Progress
}
    
enum Severity {
    case High
    case Medium
    case Low
}
    
enum Priority {
    case Blocker
    case Critical
    case Major
    case Minor
}

class Bug {

    static var ID: Int = 0
    
    let Notifyer: String
    let Summary: String
    let DateTime: String
    var StepsToReproduce: Array<String>? = nil
    var Assignee: String
    var FixedProductVersion: String? = nil
    
    var priority: Priority
    let severity: Severity
    var status: Status

    func changePriority(_ updatePrior: Priority){
        self.priority = updatePrior
    }

    func signAssignee(_ sign: String){
        self.Assignee = sign
    }
    
    func changeStatus(_ updateStat: Status){
        self.status = updateStat
    }
    
    init(severity: Severity, status: Status) {
        self.severity = severity
        self.status = status

        self.priority = Priority.Minor
        self.Notifyer = "none"
        self.Summary = "none"
        self.DateTime = "none"
        self.StepsToReproduce = nil
        self.Assignee = "none"
        self.FixedProductVersion = nil
    }
    
    init(notifyer: String, 
    summary: String, 
    dateTime: String, 
    stepsToReproduce: Array<String>?, 
    _ assignee: String, 
    _ fixedProductVersion: String?) {
        
        self.Notifyer = notifyer
        self.Summary = summary
        self.DateTime = dateTime
        self.StepsToReproduce = stepsToReproduce
        self.Assignee = assignee
        self.FixedProductVersion = fixedProductVersion
        
        self.priority = Priority.Minor
        self.severity = Severity.Low
        self.status = Status.In_Progress
        
        Bug.ID += 1
    }
    
    
}

var bugOne: Bug = Bug.init(notifyer: "1", summary: "1", dateTime: "2", stepsToReproduce: nil, "1", nil)
var bugTwo: Bug = Bug.init(notifyer: "1", summary: "1", dateTime: "2", stepsToReproduce: nil, "1", nil)

print(Bug.ID)
bugOne.changePriority(Priority.Blocker)
bugOne.signAssignee("Valter")
bugOne.changeStatus(Status.Closed)
print("\(bugOne.priority) + \(bugOne.Assignee) + \(bugOne.status)")

print("\n======== TASK 3 ========\n")

