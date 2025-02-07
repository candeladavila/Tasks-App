//
//  HeadView.swift
//  Tasks
//
//  Created by Candela Dávila Moreno on 7/2/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 2)
                .foregroundColor(Color.green) //Command to change color
                .rotationEffect(Angle(degrees: 15)) //Command used to rotate elements
                
            
            VStack{
                Text("Tasks")
                    .foregroundColor(Color.white)
                    .bold() //Command to modify text style
                    .font(.system(size:50)) //Set text size with system
                Text("Get things done")
                    .foregroundColor(Color.white)
                    .font(.system(size:30))
            }
            .padding(.top,30)
        }
        .frame(width:UIScreen.main.bounds.width * 3, height:300)
        .offset(y:-100) //moves everything up
        
    }
}

#Preview {
    HeaderView()
}
