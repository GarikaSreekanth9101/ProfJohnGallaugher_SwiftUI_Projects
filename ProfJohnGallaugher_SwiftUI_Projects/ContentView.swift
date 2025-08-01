//
//  ContentView.swift
//  ProfJohnGallaugher_SwiftUI_Projects
//
//  Created by Suja Associates on 29/07/25.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var imageString: String = ""
    @State private var message: String = ""
    
    @State private var count: Int = 0
    
//    private var imgArray: [String] = ["image0","image1","image2","image3","image4","image5","image6","image7","image8","image9"]
    
    
    var body: some View {
        
        VStack {
            Spacer()
            Image(imageString)
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
            Spacer()
            Button("Show Message"){
            
                let message1 = "You Are Awesome!"
                let message2 = "You Are Great!"
                
                self.message = self.message == message1 ? message2 : message1
                self.imageString = "image\(count)"
                
                count += 1
                
                if count > 9{
                    count = 0
                }
                
              
                
//                if count > 9{
//                    count = 0
//                    self.message = self.message == message1 ? message2 : message1
////                    self.imageString = imgArray[count]
//                    self.imageString = "image\(count)"
//                }else{
//                    self.message = self.message == message1 ? message2 : message1
////                    self.imageString = imgArray[count]
//                    self.imageString = "image\(count)"
//                }
               
                
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
