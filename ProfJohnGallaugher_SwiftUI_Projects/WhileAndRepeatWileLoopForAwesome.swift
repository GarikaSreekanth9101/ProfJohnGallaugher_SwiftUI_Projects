//
//  WhileAndRepeatWileLoopForAwesome.swift
//  ProfJohnGallaugher_SwiftUI_Projects
//
//  Created by Suja Associates on 04/08/25.
//

import SwiftUI

struct WhileAndRepeatWileLoopForAwesome: View {
    
    
    @State private var imageString: String = ""
    @State private var message: String = ""
 
    
    @State private var lastImageNumber: Int = -1
    @State private var lastMessageNumber: Int = -1 // last message number never be -1
    
    private var imgArray: [String] = ["image0","image1","image2","image3","image4","image5","image6","image7","image8","image9"]
    
    private var messageArray: [String] = ["When I'm around you I feel like I could fly","You're Magic","I sleep 18 hrs a day, but I'm glad I got up to see you!","Anybody seen Nemo?","Wow! I'm glad I came out. I didn't expect to see you!","Whoos' that?\nAwesomeness in human form","Plenty of fish in the sea but none like you!","You bring me out of my shell!","Prepare for Bease Mode","It's Good to Have Friends"]
    
    
    var body: some View {
        
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 120)
                .animation(.easeInOut(duration: 0.15), value: message)
            Image(imageString)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageString)
            
          
            Spacer()
            Button("Show Message"){
            
//                // MARK: While Loop
//                var messageNumber: Int = Int.random(in: 0...messageArray.count - 1)
//                
//                while messageNumber == lastMessageNumber{
//                    messageNumber = Int.random(in: 0...messageArray.count - 1)
//                }
//                self.message = messageArray[messageNumber]
//                self.lastMessageNumber = messageNumber
//                
//                
//                var imageNumber: Int = Int.random(in: 0...imgArray.count - 1)
//                
//                while imageNumber == lastMessageNumber{
//                    imageNumber = Int.random(in: 0...imgArray.count - 1)
//                }
//                self.imageString = imgArray[imageNumber]
//                self.lastImageNumber = imageNumber
                
                
                // MARK: Repeat While Loop
                var messageNumber: Int
                repeat{
                    messageNumber = Int.random(in: 0...messageArray.count - 1)
                }while messageNumber == lastMessageNumber
                self.message = messageArray[messageNumber]
                self.lastMessageNumber = messageNumber
                
                
                var imageNumber: Int
                repeat{
                    imageNumber = Int.random(in: 0...imgArray.count - 1)
                }while imageNumber == lastMessageNumber
                self.imageString = imgArray[imageNumber]
                self.lastImageNumber = imageNumber

            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
        
    }
}

#Preview {
    WhileAndRepeatWileLoopForAwesome()
}
