import Cocoa

var currentDate = Date(timeIntervalSinceNow: 10000)

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
    var DateTime: Date
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
        self.DateTime = Date(timeIntervalSinceNow: 10000)
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
        self.DateTime = Date(timeIntervalSinceNow: 10000)
        self.StepsToReproduce = nil
        self.Assignee = "none"
        self.FixedProductVersion = nil
    }
    
    init(notifyer: String,
    summary: String,
    dateTime: Date,
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
        self.DateTime = Date(timeIntervalSinceNow: 10000)
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

var bugOne: Bug = Bug.init(notifyer: "1", summary: "1", dateTime: currentDate, stepsToReproduce: nil, "1", nil)
var bugTwo: Bug = Bug.init(notifyer: "1", summary: "1", dateTime: currentDate, stepsToReproduce: nil, "1", nil)

print("Current date & time: \(currentDate)")

print("\n======== TASK 1 ========\n")

extension Int {

    func isEven() -> Bool {
        let check = self % 2 == 0 ? true : false
        return check
    }

    func isOdd() -> Bool {
        let check = self % 2 != 0 ? true : false
        return check
    }
    
    subscript (_ digit: Int) -> Int {
        var decimalBase = 0
        var sumOfDigit = 0
        var currentNum = self
        while currentNum > 0 {
            decimalBase = currentNum % 10
            if (decimalBase == digit) {
                sumOfDigit += 1
            }
            currentNum /= 10
        }
        return sumOfDigit
    }
}

var someNumber: Int = 29
print("Is 29 even? - \(someNumber.isEven())")
print("Is 29 odd? - \(someNumber.isOdd())")
var someNumberTwo: Int = 1133334
print("Amount of 3 in \(someNumberTwo) - \(someNumberTwo[3])")

extension Bug {
    convenience init(_ updateDate: Date) {
        self.init()
        self.DateTime = updateDate
    }
    
    func daysUntilClose() -> Int {
        var days = 0
        let calendar = Calendar.current
        if self.status != Status.Closed{
            days = ( calendar.component(.year, from: currentDate) -  calendar.component(.year, from: self.DateTime) ) * 365 +
                ( calendar.component(.month, from: currentDate) -  calendar.component(.month, from: self.DateTime) ) * 30 +
                calendar.component(.day, from: currentDate) - calendar.component(.day, from: self.DateTime)
        }
        return days
    }
    
    func reopeningBug() {
        self.status = Status.Reopened
        self.DateTime = currentDate
    }
}

var testBug: Bug = Bug.init(currentDate)
print("Testing conven init - \(testBug.DateTime)")
print("Days until closed - \(testBug.daysUntilClose()) + \(testBug.status)")

testBug.reopeningBug()
print("Reopened bug - \(testBug.status) + \(testBug.DateTime)")

print("\n======== TASK 2 ========\n")

protocol BugTracker {
    var bugCollection: Array<Bug> {get set}
    
    func createBugCollection()
    func definebugCollection(_ someCollection: Array<Bug>)
    func changeCollectionStatus(_ newStat: Status)
    func sortBugCollection()
}

extension BugTracker {
    func prepareSummary() {
        print("\n--- We have \(self.bugCollection.count) bug/s in collection ---\n")
        for elem in self.bugCollection{
            print("\n*** Bug status: \(elem.status)\nBug date: \(elem.DateTime)\nBug notifyer: \(elem.Notifyer) ***\n")
        }
    }
}

class JIRA : BugTracker {
    
    var bugCollection: Array<Bug> = []
    
    func createBugCollection() {
        
        let someBugOne: Bug = Bug.init(notifyer: "Mike", summary: "simple bug", dateTime: currentDate, stepsToReproduce: nil, "Likel1", nil)
        let someBugTwo: Bug = Bug.init(notifyer: "Bill", summary: "also simple bug", dateTime: currentDate, stepsToReproduce: nil, "Corse1334", nil)
        self.bugCollection.append(someBugOne)
        self.bugCollection.append(someBugTwo)
    }
    
    func definebugCollection(_ someCollection: Array<Bug>) {
        self.bugCollection = someCollection
    }
    
    func changeCollectionStatus(_ newStat: Status) {
        for elem in bugCollection{
            elem.status = newStat
        }
        print("Now all bugs have status - \(newStat)")
    }
    
    func sortBugCollection() {
        bugCollection.sort(by: {$0.DateTime > $1.DateTime} )
        print("\n--- Collection was sorted by DESC date ---\n")
        for elem in bugCollection{
            print("Bug: \(elem.Assignee) + \(elem.Notifyer) + \(elem.DateTime)")
        }
    }
}

var jiraClass: JIRA = JIRA.init()
jiraClass.createBugCollection()
jiraClass.sortBugCollection()
jiraClass.changeCollectionStatus(Status.In_Progress)
jiraClass.prepareSummary()

print("\n======== TASK 3 ========\n")

struct IssueList<T> {
    
    var issues = [T]()
    init() {}
    mutating func add(_ item: T) {
        issues.append(item)
        print("\(item) has been added")
    }
    
    mutating func remove() -> T {
        let removeObj = issues.removeFirst()
        print("First elem \(removeObj) of collection has been deleted\n")
        return removeObj
    }
}

var issueList: IssueList<Bug> = IssueList.init()
issueList.add(bugOne)
issueList.add(bugTwo)

issueList.remove()

extension IssueList {
    
}

print("\n======== TASK 4 ========\n")
