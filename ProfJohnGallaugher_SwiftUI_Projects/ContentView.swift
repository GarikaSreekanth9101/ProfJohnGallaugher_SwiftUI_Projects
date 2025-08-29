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
    
    @State private var firstNumber: Int = 0
    @State private var secondNumber: Int = 0
    @State private var firstNumberEmojis: String = ""
    @State private var secondNumberEmojis: String = ""
    @FocusState private var isFocused: Bool
    @State private var result: String = ""
    @State private var finalResult: String = ""
    @State private var message: String = ""
    
    @State private var textFieldDisabled: Bool = false
    @State private var buttonDisabled: Bool = false
    @State private var isCorrectAnswer: Bool = false

    
    private let emojis: [String] = ["🍕", "🍎", "🍏", "🐵", "👽", "🧠", "🧜🏽‍♀️", "🧙🏿‍♂️", "🥷", "🐶", "🐹", "🐣", "🦄", "🐝", "🦉", "🦋", "🦖", "🐙", "🦞", "🐟", "🦔", "🐲", "🌻", "🌍", "🌈", "🍔", "🌮", "🍦", "🍩", "🍪"]
    
   
    
    var body: some View {
        
        VStack{
            Group{
                Text(firstNumberEmojis)
                Text("+")
                Text(secondNumberEmojis)
            }
            .font(Font.system(size: 80))
            .multilineTextAlignment(.center)
            .minimumScaleFactor(0.5)
            .animation(.default, value: message)
            
            Spacer()
            
            Text("\(firstNumber) + \(secondNumber) = \(finalResult)")
                .font(.largeTitle)
                .animation(.default, value: message)
            TextField("", text: $result)
                .font(.largeTitle)
                .frame(width: 60.0)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray, lineWidth: 2)
                }
                .multilineTextAlignment(.center)
                .focused($isFocused)
                .disabled(textFieldDisabled)
            
            Button("Guess") {
                //TODO: Button Action
                isFocused = false
                guard let answer = Int(result) else {return}
                if answer == firstNumber + secondNumber {
                    playSound(soundName: "correct")
                    message = "Correct!"
                    isCorrectAnswer = true
                }else{
                    playSound(soundName: "wrong")
                    message = "Sorry, the correct answer is \(firstNumber + secondNumber) "
                    isCorrectAnswer = false
                }
                //finalResult = String(firstNumber + secondNumber)
                textFieldDisabled = true
                buttonDisabled = true
            }
            .buttonStyle(.borderedProminent)
            .disabled(result.isEmpty || buttonDisabled)
            
            Spacer()
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.black)
                .multilineTextAlignment(.center)
                .foregroundStyle(isCorrectAnswer ? .green : .red)
                .animation(.default, value: message)
                .minimumScaleFactor(0.5)
            
            Spacer()
            
            if message != "" {
                
                Button("Play Again?") {
                    //TODO: Play Again Button Action
                    initialData()
                }
            }
            
         
          
            
        }//VStack
        .padding()
        .onAppear(){
            initialData()
        }
        
    }
    
    func initialData(){
        firstNumber = Int.random(in: 1...10)
        secondNumber = Int.random(in: 1...10)
        
        firstNumberEmojis = String(repeating: emojis.randomElement()!, count: firstNumber)
        secondNumberEmojis = String(repeating: emojis.randomElement()!, count: secondNumber)
        
        result = ""
        message = ""
        
        textFieldDisabled = false
        buttonDisabled = false
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
