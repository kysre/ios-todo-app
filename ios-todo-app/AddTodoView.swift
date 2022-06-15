//
//  AddTodoView.swift
//  ios-todo-app
//
//  Created by Kasra Hajian on 6/15/22.
//

import SwiftUI

struct AddTodoView: View {
    @Binding var todo: Todo
    
    var body: some View {
        Form {
            Section(header: Text("Todo Info")) {
                TextField("Name", text: $todo.name)
                DatePicker("Due Date",
                           selection: $todo.date,
                           displayedComponents: [.date, .hourAndMinute]
                )
            }
        }
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView(todo: .constant(Todo()))
    }
}
