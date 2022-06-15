import Foundation

class Todo: Identifiable{
    static var todos : [Todo] = []
    var id: UUID
    var name: String
    var date: Date
    
    init(id: UUID = UUID(), name: String = "", date: Date = Date()){
        self.id = id
        self.name = name
        self.date = date
        Todo.todos.append(self)
    }
    
    static func sort() {
        todos.sort(by:{$0.date > $1.date})
    }
}

extension Todo {
    static let sampleData: [Todo] =
    [
        Todo(name: "Todo-1", date: Date()),
        Todo(name: "Todo-2", date: Date()),
        Todo(name: "Todo-3", date: Date())
    ]
}
