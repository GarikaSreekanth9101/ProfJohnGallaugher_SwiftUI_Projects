//
//  SwiftUIViewFundamentals3.swift
//  ProfJohnGallaugher_SwiftUI_Projects
//
//  Created by Suja Associates on 07/08/25.
//

import SwiftUI

//struct SwiftUIViewFundamentals3: View {
//    
//    @State private var message: String = "You Are Awesome!"
//    
//    var body: some View {
//        
//        //To set background color we can keep in ZStack or
//        //Bellow the VStack also we can change
//        
//        //        ZStack {
//        //            //For background Color
//        //            Color(.gray)
//        //                .ignoresSafeArea()
//        //        }
//        
//        
//        VStack(){
//            
//            
//            Text("You have skills!")
//                .font(.largeTitle)
//                .fontWeight(.black)
//            
//                .foregroundStyle(.skyBlue)
//                .multilineTextAlignment(.center)
//            
//                .padding()
//                .background(.accent)
//                .clipShape(RoundedRectangle(cornerRadius: 30))
//            Spacer()
//            Text(message)
//                .foregroundStyle(.accent)
//                .font(.largeTitle)
//                .fontWeight(.heavy)
//                .multilineTextAlignment(.center)
//                .minimumScaleFactor(0.5)
//                .frame(height: 150)
//                .frame(maxWidth: .infinity)
//                .padding()
//            
//            Spacer()
//            
//            Divider()
//                .background(.yellow)
//                
//                
//                 // by using this we can devide by elements
//            
//            HStack{
//                Button("Awesome") {
//                    message = "You Are Awesome!"
//                }
//                //                .tint(.fernandez)
//                Spacer()
//                Button("Great") {
//                    message = "You Are Great!"
//                }
//                //                .tint(.gray)
//            }
//            .buttonStyle(.borderedProminent)
//            .foregroundStyle(.white)
//            .font(.title2)
//            .tint(.launchScreenBG)
//            .padding()
//            
//        }
//        //            .background(.black.gradient)
//        //Gradient Colors
//        //        .background(
//        //            Gradient(colors: [.fernandez, .skyBlue, .launchScreenBG, .accent])
//        //        )
//    }
//}

//MARK: LayOut Designs
struct SwiftUIViewFundamentals3: View {
    
    @State private var message: String = "You Are Awesome!"
    
    var body: some View {
        
        
        VStack(){
            
            
            Text("You have skills!")
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.indigo)
            
            Spacer()
            Text(message)
                .foregroundStyle(.indigo)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 150)
                .frame(maxWidth: .infinity)
                .padding()
            
            Spacer()
            
            HStack{
                Button("Awesome") {
                    message = "You Are Awesome!"
                }
                Spacer()
                Button("Great") {
                    message = "You Are Great!"
                }
            }
            .buttonStyle(.borderedProminent)
            .foregroundStyle(.white)
            .font(.title2)
            .tint(.indigo)
            .padding()
            
            Rectangle()
                .background(.indigo)
                .frame(maxHeight: 0)
        }
    }
}

#Preview {
    SwiftUIViewFundamentals3()
}
