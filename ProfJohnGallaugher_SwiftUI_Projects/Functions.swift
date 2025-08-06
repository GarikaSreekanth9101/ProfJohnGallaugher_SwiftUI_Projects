//
//  Functions.swift
//  ProfJohnGallaugher_SwiftUI_Projects
//
//  Created by Suja Associates on 06/08/25.
//

import SwiftUI
import AVFAudio


struct Functions: View {
    
    
    @State private var audioPlayer: AVAudioPlayer!
    
    
    @State private var imageString: String = ""
    @State private var message: String = ""
    
    
    @State private var lastSoundNumber: Int = -1
    @State private var lastImageNumber: Int = -1
    @State private var lastMessageNumber: Int = -1 // last message number never be -1
    let numberOfSounds = 6
    
    
    
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
            
            Spacer()
            
            Image(imageString)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageString)
            
            
            Spacer()
            Button("Show Message"){
                
                // MARK: Repeat While Loop

                self.lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBound: messageArray.count - 1)
                self.message = messageArray[self.lastMessageNumber]

                
                self.lastImageNumber = nonRepeatingRandom(lastNumber: self.lastImageNumber, upperBound: self.imgArray.count - 1)
                self.imageString = imgArray[self.lastImageNumber]

                
                self.lastSoundNumber = nonRepeatingRandom(lastNumber: self.lastSoundNumber, upperBound: numberOfSounds - 1)
                
                
                let soundName = "sound\(self.lastSoundNumber)"
                playSound(soundName: soundName)

            
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
        
    }
    
    func playSound(soundName: String){
        
        
        guard let soundFile = NSDataAsset(name: soundName)else{
            print("😡 Could not read file named \(soundName)")
            return
        }
        
        do{
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        }catch{
            print("😡 ERROR: \(error.localizedDescription) creating audio player!")
        }
    }
    
    func nonRepeatingRandom(lastNumber: Int, upperBound: Int) -> Int{
        
        var newNumber: Int
        
        repeat{
            newNumber = Int.random(in: 0...upperBound)
        }while newNumber == lastNumber
        return newNumber
    }
    
}

#Preview {
    Functions()
}
