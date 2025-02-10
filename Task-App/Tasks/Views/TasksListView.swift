//
//  TasksItemsView.swift
//  Tasks
//
//  Created by Candela Dávila Moreno on 7/2/25.
//

import FirebaseFirestore
import SwiftUI

struct TasksListView: View {
    @StateObject var viewModel = TasksListViewModel()
    @FirestoreQuery var items: [TaskItem]

    
    init(userId: String){
        //users /<id> /tasks/<entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/tasks")
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
