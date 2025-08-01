//
//  SwitchAnTernaryOperators.swift
//  ProfJohnGallaugher_SwiftUI_Projects
//
//  Created by Suja Associates on 01/08/25.
//

import SwiftUI

struct SwitchAnTernaryOperators: View {
    
    
    @State private var imageString: String = ""
    @State private var message: String = ""
    
    
    var body: some View {
        
        VStack {
            Spacer()
            Image(systemName: imageString)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            Spacer()
            Button("Press Me!"){
                
                let message1 = "You Are Awesome!"
                let message2 = "You Are Great!"
                let imageString1 = "sun.max.fill"
                let imageString2 = "hand.thumbsup"
                
                //MARK: - Ternary Operations
                self.message = self.message == message1 ? message2 : message1
                self.imageString = self.imageString == imageString1 ? imageString2 : imageString1
                
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.orange)
            
        }
        .padding()
        
    }
}

#Preview {
    SwitchAnTernaryOperators()
}
