//
//  SwiftUIViewFundamentals.swift
//  ProfJohnGallaugher_SwiftUI_Projects
//
//  Created by Suja Associates on 06/08/25.
//

import SwiftUI

struct SwiftUIViewFundamentals: View {
    
    var body: some View {
        
        VStack{
            
            ZStack{
                
                Circle()
                    .fill(.cyan.gradient)
                
                Image(systemName: "swift")

                    .resizable()
                    .scaledToFit()
                    .scaleEffect(0.6)
                    .foregroundStyle(.white)
                
            }
            
            Text("You Are Awesome!")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(.red)
            
            
            
            
            
//            Image(systemName: "swift")
//
//                .resizable()
//                .scaledToFit()
//                .scaleEffect(0.6)
//                .foregroundStyle(.white)
//                .background(in: .circle)
//                .backgroundStyle(.cyan.gradient)
//            
//            Text("You Are Awesome!")
//                .font(.largeTitle)
//                .fontWeight(.black)
//                .foregroundStyle(.red)
        }
        .padding()

        
    }
    
}

#Preview {
    SwiftUIViewFundamentals()
}
