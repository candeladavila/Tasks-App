//
//  ContentView.swift
//  Tasks
//
//  Created by Candela Dávila Moreno on 7/2/25.
//

import SwiftUI

struct MainView: View {
    //Before showing LoginView check if a user is already logged in
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            //if already signed in
            TasksListView()
        } else{
            LoginView()
        }

    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        MainView()
    }
}


