//
//  SwiftUIViewFundamentals2.swift
//  ProfJohnGallaugher_SwiftUI_Projects
//
//  Created by Suja Associates on 07/08/25.
//

import SwiftUI

struct SwiftUIViewFundamentals2: View {
    
    @State private var message: String = "You Are Awesome!"
    
    var body: some View {
        
        VStack(spacing: 16){
            
            Text(message)
                .foregroundStyle(.accent)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 150)
                .frame(maxWidth: .infinity)
                .border(.orange, width: 3)
                .padding()
            
            
            HStack{
                Button("Awesome") {
                    message = "You Are Awesome!"
                }
                
                Button("Great") {
                    message = "You Are Great!"
                }
            }
            .buttonStyle(.borderedProminent)
            .foregroundStyle(.white)
            .font(.title2)
            .border(.purple, width: 3)
            
        }
    }
    
}

#Preview {
    SwiftUIViewFundamentals2()
}
