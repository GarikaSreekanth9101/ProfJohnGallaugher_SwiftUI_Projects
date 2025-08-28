//
//  ContentView.swift
//  ProfJohnGallaugher_SwiftUI_Projects
//
//  Created by Suja Associates on 29/07/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    
    @State private var wordsGuessed: Int = 0
    @State private var wordsMissed: Int = 0
    private let wordsToGuess: [String] = ["SWIFT","DOG","CAT"] // All caps
    @State private var gameStatusMessage: String = "How Many Guesses to Uncover the Hidden Word?"
    @State private var currentWordIndex: Int = 0 // index in wordsToGuess
    @State private var wordToGuess: String = ""
    @State private var revealedWord: String = ""
    @State private var lettersGuessed: String = ""
    @State private var guessesRemaining: Int = maxGuesses
    private static var maxGuesses: Int = 8// need to refer this as self.maxGuesses
    @State private var guessedLetter: String = ""
    @State private var imageName: String = "flower8"
    @State private var playAgainHidden: Bool = true
    @State private var playAgainButtonLbl: String = "Another Word?"
    @State private var audioPlayer: AVAudioPlayer!
    
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
                .frame(height: 100.0)
                .minimumScaleFactor(0.5)
                .padding()
            //TODO: Switch to wordsToGuess[currentWordIndex]
            Text(revealedWord)
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
                        .submitLabel(.done)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.characters)
                        .onChange(of: guessedLetter) {
                            guessedLetter = guessedLetter.trimmingCharacters(in: .letters.inverted)
                            guard let lastChar = guessedLetter.last else {return}
                            guessedLetter = String(lastChar).uppercased()
                        }
                        .focused($textFieldIsFocussed)
                        .onSubmit {
                            //As long as guessedLetter is not empty string we can continue, otherwise don't do anything
                            guard guessedLetter != "" else {return}
                            guessALetter()
                            updateGamePlay()
                        }
                    
                    Button("Guess a Letter") {
                        //TODO: - Guess a letter button action
                        guessALetter()
                        updateGamePlay()
                    }
                    .buttonStyle(.bordered)
                    .tint(.mint)
                    .disabled(guessedLetter.isEmpty)
                }
            }else{
                Button(playAgainButtonLbl) {
                    //TODO: - Another Word button action
                    //If all the words have been Guessed
                    if currentWordIndex == wordsToGuess.count {
                        currentWordIndex = 0
                        wordsMissed = 0
                        wordsGuessed = 0
                        playAgainButtonLbl = "Another Word?"
                        gameStatusMessage = gameStatusMessage + "\nYou've Tried All of the words. Restart from the Begining?"
                    }
                    //Reset after a word was guessed or missed
                    wordToGuess = wordsToGuess[currentWordIndex]
                    revealedWord = "_" + String(repeating: " _", count: wordToGuess.count-1)
                    lettersGuessed = ""
                    guessesRemaining = Self.maxGuesses//because maximum guesses is static
                    imageName = "flower\(guessesRemaining)"
                    gameStatusMessage = "How Many Guesses to Uncover the Hidden Word?"
                    playAgainHidden = true
                }
                .buttonStyle(.borderedProminent)
                .tint(.mint)
            }
            Spacer()
            Image(imageName)
                .resizable()
                .scaledToFit()
                .animation(.easeIn(duration: 0.75), value: imageName)
        }
        .ignoresSafeArea(edges: .bottom)
        .onAppear {
            wordToGuess = wordsToGuess[currentWordIndex]
            //CREATE A STRING FROM A REPEATING VALUE
            revealedWord = "_" + String(repeating: " _", count: wordToGuess.count-1)
        }
    }
    
    func guessALetter(){
        
        textFieldIsFocussed = false
        lettersGuessed = lettersGuessed + guessedLetter
        revealedWord = wordToGuess.map{ letter in
            lettersGuessed.contains(letter) ? String(letter) : "_"
        }.joined(separator: " ")
        
    }
    
    func updateGamePlay(){
        
        if !wordToGuess.contains(guessedLetter){
            
            guessesRemaining -= 1
            //Animate crumbling leaf and play the incorrect word
            imageName = "wilt\(guessesRemaining)"
            playSound(soundName: "incorrect")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.75){
                imageName = "flower\(guessesRemaining)"
            }
            
        }else{
            playSound(soundName: "correct")
        }
        //When We Do Another Word?
        if !revealedWord.contains("_"){
            //Guessed when no "_" revealedWord
            gameStatusMessage = "You Guessed It! It took you \(lettersGuessed.count) Guesses to Guess The Word"
            wordsGuessed += 1
            currentWordIndex += 1
            playAgainHidden = false
            playSound(soundName: "word-guessed")
        }else if guessesRemaining == 0{
            //Word Missed
            gameStatusMessage = "So Sorry, You'r All Out of Guesses"
            wordsMissed += 1
            currentWordIndex += 1
            playAgainHidden = false
            playSound(soundName: "word-not-guessed")
        }else{//Keep Guessing
            //TODO: ReDo this with Localized String and Inflect
            gameStatusMessage = "You've Made \(lettersGuessed.count) Guess\(lettersGuessed.count == 1 ? "" : "es")"
        }
        
        if currentWordIndex == wordsToGuess.count {
            playAgainButtonLbl = "Restart Game?"
            gameStatusMessage = gameStatusMessage + "\nYou've Tried All of the words. Restart from the Begining?"
        }
        
        guessedLetter = ""
    }
    
    func playSound(soundName: String){
        
        if audioPlayer != nil && audioPlayer.isPlaying{
            audioPlayer.stop()
        }
        guard let soundFile = NSDataAsset(name: soundName)else{
            print("😡 Could not read file named \(soundName)")
            return
        }
        do{
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        }catch{
            print("😡 ERROR: \(error.localizedDescription) creating Audio Player")
        }
    }
}

#Preview {
    ContentView()
}
