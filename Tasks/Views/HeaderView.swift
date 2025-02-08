//
//  HeadView.swift
//  Tasks
//
//  Created by Candela Dávila Moreno on 7/2/25.
//

import SwiftUI

struct HeaderView: View {
    //By stracting the parameters you abstract the view for further usage
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 2)
                .foregroundColor(background) //Command to change color
                .rotationEffect(Angle(degrees: angle)) //Command used to rotate elements
                
            
            VStack{
                Text(title)
                    .foregroundColor(Color.white)
                    .bold() //Command to modify text style
                    .font(.system(size:50)) //Set text size with system
                Text(subtitle)
                    .foregroundColor(Color.white)
                    .font(.system(size:20))
            }
            .padding(.top,80)
        }
        .frame(width:UIScreen.main.bounds.width * 3, height:350)
        .offset(y:-150) //moves everything up
        
    }
}

//This creates the preview you see on the right side of the screen
#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, background: .blue)
}
