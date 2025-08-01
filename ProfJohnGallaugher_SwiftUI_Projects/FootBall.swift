//
//  FootBall.swift
//  ProfJohnGallaugher_SwiftUI_Projects
//
//  Created by Suja Associates on 30/07/25.
//

import SwiftUI

struct FootBall: View {
    
    var body: some View {
        
        VStack{
            
            Text("What is Football to you?")
                .font(.largeTitle)
                .fontWeight(.thin)
                .foregroundStyle(.green)
            Spacer()

            HStack{
                Image(systemName: "figure.american.football")
                    .resizable()
                    .foregroundStyle(.blue)
                    .scaledToFit()
                
                Image(systemName: "figure.australian.football")
                    .resizable()
                    .foregroundStyle(.indigo)
                    .scaledToFit()
                
                Image(systemName: "figure.soccer")
                    .resizable()
                    .foregroundStyle(.purple)
                    .scaledToFit()
                
                
            }
            
            
        }
        .padding()
    }
    
}

#Preview {
    FootBall()
}
