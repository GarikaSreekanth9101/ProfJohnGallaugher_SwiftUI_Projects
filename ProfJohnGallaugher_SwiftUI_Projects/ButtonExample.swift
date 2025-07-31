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
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            Text(message)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .foregroundStyle(.orange)
            
            Button("Click Me!"){
                self.message = "You Are Awesome!"
            }
            
        }
        .padding()
        
    }
}

#Preview {
    ButtonExample()
}
