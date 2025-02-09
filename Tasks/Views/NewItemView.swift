//
//  NewItemView.swift
//  Tasks
//
//  Created by Candela Dávila Moreno on 7/2/25.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    var body: some View {
        VStack{
            Text("New Task")
                .bold()
                .font(.system(size:32))
            Form{
                //Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //Due Date
                DatePicker("Due date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())

                
                //Button
                TButton(title: "Save", background: .blue){
                    viewModel.save();
                }
                .padding()
            }
        }
    }
}

#Preview {
    NewItemView()
}
