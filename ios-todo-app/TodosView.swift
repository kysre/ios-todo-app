//
//  ContentView.swift
//  ios-todo-app
//
//  Created by Kasra Hajian on 6/9/22.
//

import SwiftUI

struct TodosView: View {
    @Binding var todos: [Todo]
    
    var body: some View {
        List {
            ForEach($todos) { $todo in
                VStack (alignment: .leading) {
                    Text(todo.name)
                        .font(.title2)
                        .padding(5)
                    HStack {
                        Text(todo.date, style: .date)
                        Spacer()
                        Text(todo.date, style: .time)
                    }
                    .padding(5)
                }
            }
        }
        .navigationTitle("Todos")
        .toolbar {
            Button(action: {}) {
                Image(systemName: "plus")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TodosView(todos: .constant(Todo.sampleData))
        }
    }
}
