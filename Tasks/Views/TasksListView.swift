//
//  TasksItemsView.swift
//  Tasks
//
//  Created by Candela Dávila Moreno on 7/2/25.
//

import FirebaseFirestoreSwift
import SwiftUI

struct TasksListView: View {
    @StateObject var viewModel = TasksListViewModel()
    @FirestoreQuery var items: [TaskItem]
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
        //users /<id> /tasks/<entries>
    }
    
    var body: some View {
        NavigationView{
            VStack{
                
            }
            .navigationTitle("Tasks")
            .toolbar{
                Button{
                    //Action
                    viewModel.showingNewItemView = true
                } label:{
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    TasksListView(userId: "")
}
