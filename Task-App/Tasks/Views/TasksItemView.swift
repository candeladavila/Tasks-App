//
//  TasksItemView.swift
//  Tasks
//
//  Created by Candela Dávila Moreno on 7/2/25.
//

import SwiftUI

struct TasksItemView: View {
    @StateObject var viewModel = ProfileViewModel()
    let item: TaskItem
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970:item.dueDate).formatted(date: .abbreviated , time: .shortened))")
                    .foregroundColor(Color(.secondaryLabel))
                    .font(.footnote)
            }
            
            Spacer()
            Button{
                viewModel.toggleIsDone(item: item)
            }label:{
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.green)
            }
        }
    }
}

#Preview {
    TasksItemView(item: .init(
        id: "123",
        title: "Get milk",
        dueDate: Date().timeIntervalSince1970,
        createDate: Date().timeIntervalSince1970,
        isDone: true))
}
