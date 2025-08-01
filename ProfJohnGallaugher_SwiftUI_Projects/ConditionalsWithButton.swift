//
//  ConditionalsWithButton.swift
//  ProfJohnGallaugher_SwiftUI_Projects
//
//  Created by Suja Associates on 01/08/25.
//

import SwiftUI

struct ConditionalsWithButton: View {
    
    
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
                
                if self.message == ""{
                    self.message = message1
                    self.imageString = imageString1
                }else if self.message == message1{
                    self.message = message2
                    self.imageString = imageString2
                }else if self.message == message2{
                    self.message = message1
                    self.imageString = imageString1
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
    ConditionalsWithButton()
}
