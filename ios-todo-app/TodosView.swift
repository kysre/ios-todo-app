//
//  ContentView.swift
//  ios-todo-app
//
//  Created by Kasra Hajian on 6/9/22.
//

import SwiftUI

struct TodosView: View {
    @Binding var todos: [Todo]
    @State private var isPresentingAddTodoView = false
    @State private var newTodo: Todo = Todo()
    
    func deleteTodo(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach($todos) { $todo in
                    CardView(todo: todo)
                }
                .onDelete(perform: deleteTodo)
            }
            .navigationTitle("Todos")
            .toolbar {
                Button(action: {
                    newTodo = Todo()
                    isPresentingAddTodoView = true
                }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $isPresentingAddTodoView) {
                NavigationView {
                    AddTodoView(todo: $newTodo)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Dismiss") {
                                    isPresentingAddTodoView = false
                                    newTodo = Todo()
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Add") {
                                    todos.append(newTodo)
                                    isPresentingAddTodoView = false
                                    newTodo = Todo()
                                }
                            }
                        }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodosView(todos: .constant(Todo.sampleData))
    }
}
