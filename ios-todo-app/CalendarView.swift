//
//  TodosDateView.swift
//  ios-todo-app
//
//  Created by Kasra Hajian on 6/15/22.
//

import SwiftUI

struct CalendarView: View {
    @Binding var todos: [Todo]
    
    var body: some View {
        NavigationView {
            List {
                ForEach($todos) { $todo in
                    CardView(todo: todo)
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
