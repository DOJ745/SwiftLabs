//import Cocoa

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

/*enum ArithmeticExpression {

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
print("Operation result - \(expr.evaluate())\n")*/

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


enum UIType {
    case Button
    case Widget
    case NavigationPanel
    case Icon
}

class Bug {

    static var ID: Int = 0
    
    var Notifyer: String{
        willSet(newValueOfNotify){
            print("Will change our notifyer \(self.Notifyer) to \(newValueOfNotify)")
        }
        didSet(oldValueOfNotify){
            print("Old notifyer \(oldValueOfNotify) has changed to \(self.Notifyer)")
        }
    }
    let Summary: String
    var DateTime: String
    var StepsToReproduce: Array<String>? = nil
    var Assignee: String
    var FixedProductVersion: String? = nil
    
    var priority: Priority
    let severity: Severity
    var status: Status
    
    lazy var whenWasNotifyed: String = self.generateNotify()
    
    func generateNotify() -> String {
        return "Who notifyed: \(self.Notifyer); When notifyed: \(self.DateTime)"
    }

    func changePriority(_ updatePrior: Priority){
        self.priority = updatePrior
    }

    func signAssignee(_ sign: String){
        self.Assignee = sign
    }
    
    func changeStatus(_ updateStat: Status){
        self.status = updateStat
    }

    
    subscript(stepNumber: Int) -> String? {
        get {
            if let step = self.StepsToReproduce?[stepNumber] {
                return step
            }
            return nil
        }
    }
    
    convenience init(info: String){
        self.init()
        print(info)
    }
    
    init() {
        self.priority = Priority.Minor
        self.Notifyer = "none"
        self.Summary = "none"
        self.DateTime = "none"
        self.StepsToReproduce = nil
        self.Assignee = "none"
        
        self.priority = Priority.Minor
        self.severity = Severity.Low
        self.status = Status.In_Progress
        self.FixedProductVersion = nil
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
    
    
    init?(fixedProductVersion: String){
        self.priority = Priority.Minor
        self.Notifyer = "none"
        self.Summary = "none"
        self.DateTime = "none"
        self.StepsToReproduce = nil
        self.Assignee = "none"
        self.FixedProductVersion = nil
        
        self.priority = Priority.Minor
        self.severity = Severity.Low
        self.status = Status.In_Progress
        
        if fixedProductVersion.isEmpty { return nil }
        self.FixedProductVersion =  fixedProductVersion
        
    }
    
    func showSmt(){
        print("Some info: \(self.Assignee) + \(self.DateTime)")
    }
}

class UIBug: Bug {

    var UIElem: UIType
    var Device: String
    
    init(uiElem: UIType, device: String) {
        
        self.UIElem = uiElem
        self.Device = device
        super.init()
    }
    
    override func showSmt() {
        print("Some UI info: \(self.Device)")
    }
}

var bugOne: Bug = Bug.init(notifyer: "1", summary: "1", dateTime: "2", stepsToReproduce: nil, "1", nil)
var bugTwo: Bug = Bug.init(notifyer: "1", summary: "1", dateTime: "2", stepsToReproduce: nil, "1", nil)

print(Bug.ID)
bugOne.changePriority(Priority.Blocker)
bugOne.signAssignee("Valter")
bugOne.changeStatus(Status.Closed)

bugOne.Notifyer = "Bill"
bugOne.DateTime = "25.03.2020"
print(bugOne.whenWasNotifyed)
bugOne.DateTime = "13.01.2010"
print("Changed date to \(bugOne.DateTime)\n")
print(bugOne.whenWasNotifyed)

print("\(bugOne.priority) + \(bugOne.Assignee) + \(bugOne.status)")

bugOne.FixedProductVersion = "0.2"
print("Version: \(bugOne.FixedProductVersion!)")

print("\n======== TASK 3 ========\n")

var uiBug: UIBug = UIBug.init(uiElem: UIType.Button, device: "IPhone 9")
var bugs = [Any]()

bugs.append(bugOne)
bugs.append(bugTwo)
bugs.append(uiBug)

var usualBugs = [Bug?]()
var uiBugs = [UIBug?]()

for elem in bugs{
    if elem is Bug{
        let usualBug = elem as! Bug
        usualBugs.append(usualBug)
    }
    if elem is UIBug{
        let someUIBug = elem as! UIBug
        uiBugs.append(someUIBug)
    }
}

for elem in usualBugs{
    print("-- Elem ---")
    elem!.showSmt()
}

for elem in uiBugs{
    print("--- UI elem ---")
    elem!.showSmt()
}
