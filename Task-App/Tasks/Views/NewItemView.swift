//
//  NewItemView.swift
//  Tasks
//
//  Created by Candela Dávila Moreno on 7/2/25.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack{
            Text("New Task")
                .font(.title).bold()
                .padding(.top, 100)
            Form{
                //Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .foregroundColor(Color.green)
                
                
                //Due Date
                DatePicker("Due date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())

                
                //Button
                TButton(title: "Save", background: .blue){
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else{
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert){
                Alert(title: Text("Error"),
                      message: Text("Please fill in all fields and select due date that is today or newer "))
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get:{
        return true
    }, set: { _ in
    }))
}
