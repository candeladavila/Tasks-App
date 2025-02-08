//
//  TButton.swift
//  Tasks
//
//  Created by Candela Dávila Moreno on 8/2/25.
//

import SwiftUI

struct TButton: View {
    let title : String
    let background: Color
    let action:() -> Void
    
    var body: some View {
        Button{
            //Action
            action()
        } label:{
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TButton(title: "Title", background: .blue){
        //Action
    }
}
