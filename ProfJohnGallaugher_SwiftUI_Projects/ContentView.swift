//
//  ContentView.swift
//  ProfJohnGallaugher_SwiftUI_Projects
//
//  Created by Suja Associates on 29/07/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var wordsGuessed: Int = 0
    @State private var wordsMissed: Int = 0
    @State private var wordsToGuess: [String] = ["SWIFT","DOG","CAT"] // All caps
    @State private var gameStatusMessage: String = "How Many Guesses to Uncover the Hidden Word?"
    @State private var currentWord: Int = 0 // index in wordsToGuess
    @State private var guessedLetter: String = ""
    @State private var imageName: String = "flower8"
    @State private var playAgainHidden: Bool = true
    @FocusState private var textFieldIsFocussed: Bool
    
    var body: some View {
        
        VStack {
            
            HStack{
                VStack(alignment: .leading){
                    Text("Words Guessed: \(wordsGuessed)")
                    Text("Words Missed: \(wordsMissed)")
                }
                Spacer()
                VStack(alignment: .trailing){
                    Text("Words to Guess: \(wordsToGuess.count - (wordsGuessed + wordsMissed))")
                    Text("Words in Game: \(wordsToGuess.count)")
                }
            }
            .padding(.horizontal)
            Spacer()
            Text(gameStatusMessage)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            Text("_ _ _ _ _")
                .font(.title)
            
            if playAgainHidden{
                HStack{
                    //MARK: TextField
                    TextField("", text: $guessedLetter)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 30)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray, lineWidth: 2)
                        }// textfiled border setup
                        .keyboardType(.asciiCapable)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.characters)
                        .onChange(of: guessedLetter) {
                            guessedLetter = guessedLetter.trimmingCharacters(in: .letters.inverted)
                            guard let lastChar = guessedLetter.last else {return}
                            guessedLetter = String(lastChar).uppercased()
                        }
                        .focused($textFieldIsFocussed)
                    
                    Button("Guess a Letter") {
                        //TODO: - Guess a letter button action
                       // playAgainHidden = false
                        textFieldIsFocussed = false
                    }
                    .buttonStyle(.bordered)
                    .tint(.mint)
                    .disabled(guessedLetter.isEmpty)
                }
            }else{
                Button("Another Word?") {
                    //TODO: - Another Word button action
                   // playAgainHidden = true
                }
                .buttonStyle(.borderedProminent)
                .tint(.mint)
            }
            Spacer()
            Image(imageName)
                .resizable()
                .scaledToFit()
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    ContentView()
}
