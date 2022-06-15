//
//  CardView.swift
//  ios-todo-app
//
//  Created by Kasra Hajian on 6/15/22.
//

import SwiftUI

struct CardView: View {
    let todo: Todo
    var body: some View {
        VStack(alignment: .leading) {
            Text(todo.name)
                .font(.headline)
            Spacer()
            HStack {
                Label {
                    Text(todo.date, style: .date)
                } icon: {
                    Image(systemName: "calendar")
                        .foregroundColor(Color.black)
                }
                Spacer()
                Label {
                    Text(todo.date, style: .time)
                } icon: {
                    Image(systemName: "clock")
                        .foregroundColor(Color.black)
                }
                .labelStyle(.trailingIcon)
            }
            .font(.caption)
        }
        .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(todo: Todo.sampleData[0])
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
