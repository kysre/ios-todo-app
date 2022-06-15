//
//  ios_todo_appApp.swift
//  ios-todo-app
//
//  Created by Kasra Hajian on 6/9/22.
//

import SwiftUI

@main
struct ios_todo_appApp: App {
    @State private var todos = Todo.todos
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TodosView(todos: $todos)
            }
        }
    }
}
