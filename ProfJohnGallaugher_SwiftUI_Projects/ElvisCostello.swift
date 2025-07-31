//
//  ElvisCostello.swift
//  ProfJohnGallaugher_SwiftUI_Projects
//
//  Created by Suja Associates on 31/07/25.
//

import SwiftUI

struct ElvisCostello: View {
    
    @State private var titleText: String = "What's So Funny 'Bout"
    @State private var textInput: String = ""
    @State private var imageInput: String = ""
    
    var body: some View {
        
        VStack{
            
            Text("What's So Funny 'Bout")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(.purple)
            Spacer()
            
            VStack(spacing: 30){
                Image(systemName: imageInput)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                Text(textInput)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundStyle(.purple)
            }
            Spacer()
            
            HStack{
                Button("Peace") {
                    imageInput = "peacesign"
                    textInput = "Peace"
                }
                Button("Love") {
                    imageInput = "heart"
                    textInput = "Love"
                }
                Button("Understanding") {
                    imageInput = "lightbulb"
                    textInput = "Understanding"
                }
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle)
            .font(.title2)
            .tint(.purple)
        }
        
        .padding()
    }
    
}

#Preview {
    ElvisCostello()
}
