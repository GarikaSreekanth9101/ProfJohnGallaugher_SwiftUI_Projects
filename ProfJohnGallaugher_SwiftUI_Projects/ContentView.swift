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
    
    private var imgArray: [String] = ["image0","image1","image2","image3","image4","image5","image6","image7","image8","image9"]
    
    private var messageArray: [String] = ["When I'm around you I feel like I could fly","You're Magic","I sleep 18 hrs a day, but I'm glad I got up to see you!","Anybody seen Nemo?","Wow! I'm glad I came out. I didn't expect to see you!","Whoos' that?\nAwesomeness in human form","Plenty of fish in the sea but none like you!","You bring me out of my shell!","Prepare for Bease Mode","It's Good to Have Friends"]
    
    
    var body: some View {
        
        VStack {
            Spacer()
            Image(imageString)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
            Spacer()
            Button("Show Message"){
            
                let message1 = "You Are Awesome!"
                let message2 = "You Are Great!"
                
//                self.message = self.message == message1 ? message2 : message1
//                self.imageString = "image\(count)"
                
                self.message = messageArray[count]
                self.imageString = imgArray[count]
                
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
