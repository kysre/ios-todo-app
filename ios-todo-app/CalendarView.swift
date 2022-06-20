//
//  TodosDateView.swift
//  ios-todo-app
//
//  Created by Kasra Hajian on 6/15/22.
//

import SwiftUI

struct CalendarView: View {
    @Binding var todos: [Todo]
    @State var shownTodos: [Todo] = []
    @State var chosenDate: Date = Date()
    
    func deleteTodo(at offsets: IndexSet) {
        let idsToDelete = offsets.map {
            shownTodos[$0].id
        }
        todos.removeAll(where: { idsToDelete.contains($0.id) })
        shownTodos.remove(atOffsets: offsets)
    }
    
    func sortTodos(showDate: Date) {
        shownTodos = Todo.getAllTodosByDate(todos: todos, date: showDate)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Todos Date")) {
                    DatePicker("Due Date",
                               selection: $chosenDate,
                               displayedComponents: [.date]
                    )
                    .onChange(of: chosenDate) { [] newDate in
                        sortTodos(showDate: newDate)
                    }
                }
                List {
                    ForEach($shownTodos) { $todo in
                        CardView(todo: todo)
                    }
                    .onDelete(perform: deleteTodo)
                }
            }
            .navigationTitle("Calendar")
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(todos: .constant(Todo.sampleData))
    }
}
