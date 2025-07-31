//
//  ButtonExample.swift
//  ProfJohnGallaugher_SwiftUI_Projects
//
//  Created by Suja Associates on 31/07/25.
//

import SwiftUI

struct ButtonExample: View {
    
    @State private var message: String = "I am A Programmer!"
    
    var body: some View {
        
        VStack {
            Spacer()
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
                .frame(width: 300, height: 300)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            Spacer()
            HStack {
                Button("Awesome"){
                    self.message = "Awesome!"
                }
                Button("Great"){
                    self.message = "Great!"
                }
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.orange)
            
        }
        .padding()
        
    }
}

#Preview {
    ButtonExample()
}
