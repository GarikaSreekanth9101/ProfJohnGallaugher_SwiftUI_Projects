//
//  ContentView.swift
//  ProfJohnGallaugher_SwiftUI_Projects
//
//  Created by Suja Associates on 29/07/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    
    @State private var audioPlayer: AVAudioPlayer!
    @State private var isFullSize: Bool = true
    
    var body: some View {
        
        VStack{
            Spacer()
            //MARK: Image
            Image("clown")
                .resizable()
                .scaledToFit()
                .scaleEffect(isFullSize ? 1.0 : 0.9)
                .onTapGesture {
                    playSound(soundName: "punchSound")
                    isFullSize = false // will imedeiately shrink using .scalEffect to 90% of size
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.3)) {
                        isFullSize = true//will go from 90% to 100% size but using the .spring animation
                    }
                }
            Spacer()
            //MARK: Button
            Button {
                //TODO: Button Action Here
                
            } label: {
                Label("Photo Library", systemImage: "photo.fill.on.rectangle.fill")
            }
        }
        .padding()
    }
    
    func playSound(soundName: String){
        
        if audioPlayer != nil && audioPlayer.isPlaying{
            audioPlayer.stop()
        }
        
        guard let soundFile = NSDataAsset(name: soundName) else{
            print("😡 Could not read file named \(soundName)")
            return
        }
        
        do{
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        }catch{
            print("😡 ERROR: \(error.localizedDescription) creating audio player")
        }
        
    }
    
}

#Preview {
    ContentView()
}
