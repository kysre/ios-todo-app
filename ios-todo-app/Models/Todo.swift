import Foundation

class Todo: Identifiable{
//    static var todos : [Todo] = []
    var id: UUID
    var name: String
    var date: Date
    
    init(id: UUID = UUID(), name: String = "", date: Date = Date()){
        self.id = id
        self.name = name
        self.date = date
//        Todo.todos.append(self)
    }
    
    static func getAllTodosByDate(todos: [Todo], date: Date) -> [Todo] {
        var todosInDate: [Todo] = []
        for todo in todos {
            let isDateEquall = Calendar.current.isDate(date, equalTo: todo.date, toGranularity: .day)
            if isDateEquall {
                todosInDate.append(todo)
            }
        }
        todosInDate.sort {
            $0.date.compare($1.date) == .orderedAscending
        }
        return todosInDate
    }
}

extension Todo {
    static let sampleData: [Todo] =
    [
        Todo(name: "Todo-1", date: Date()),
        Todo(name: "Todo-2", date: Date()),
        Todo(name: "Todo-3", date: Date()),
        Todo(name: "Todo-4", date: Date()),
        Todo(name: "Todo-5", date: Date())
    ]
}
