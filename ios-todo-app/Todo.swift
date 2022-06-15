class Todo{
    static let ID: Int = 0
    static let allOfTodo = [Todo]
    var name = ""
    var date = NSDate()
    var id = 0
    init(name : String , date : NSDate){
        self.name = name
        self.id = ID
        self.date = date
        ID = ID + 1
        allOfTodo.append(self())
    }
    static func sort() {
        allOfTodo.sort(by:{$0.date > $1.date})
    }
}