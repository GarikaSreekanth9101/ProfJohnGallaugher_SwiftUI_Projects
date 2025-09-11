//
//  ContentView.swift
//  ProfJohnGallaugher_SwiftUI_Projects
//
//  Created by Suja Associates on 29/07/25.
//

import SwiftUI

struct ContentView: View {
    
    enum Dice: Int, CaseIterable, Identifiable{
        
        case four = 4
        case six = 6
        case eight = 8
        case ten = 10
        case twelve = 12
        case twenty = 20
        case hundered = 100
        
        
        var id: Int{//One Value Computed Properties (or functions) don't need return
            rawValue // Each raw value is unique, so It's a Good Id
        }
        
        var description: String{
            "\(id)-sided"
        }
        
        func roll() -> Int {
            return Int.random(in: 1...self.rawValue)
        }
        
    }
    
    @State private var resultMessage: String = ""
    @State private var animationTrigger: Bool = false//changed when animation occured
    @State private var isDoneAnimating: Bool = true
    
    var body: some View {
        
        VStack{
            
            
            Text("Dungeon Dice")
                .multilineTextAlignment(.center)
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(.red)
                .frame(maxWidth: .infinity)
                .padding(.bottom)
            
            Spacer()
            
            
            Text(resultMessage)
                .font(.largeTitle)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .rotation3DEffect(isDoneAnimating ? .degrees(360) : .degrees(0), axis: (x: 1, y: 0, z: 0))
                .frame(height: 150.0)
                .onChange(of: animationTrigger){
                    isDoneAnimating = false //Set to beginning "false" state right away
                    withAnimation(.interpolatingSpring(duration: 0.6, bounce: 0.4)) {
                        isDoneAnimating = true
                    }
                }
            
            
            Spacer()
            //MARK: Can we use LazyVGrid And ForEach Loop
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 102))]) {
                
                ForEach(Dice.allCases) { dice in
                    
                    Button(dice.description) {
                        resultMessage = "You rolled a \(dice.roll()) on a \(dice.rawValue)-sided dice!"
                        animationTrigger.toggle()
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
            }
            
            //MARK: Can we use Group Also
            //            Group {
            //                HStack {
            //                    Button("\(Dice.four.rawValue)-sided") {
            //                        resultMessage = "You rolled a \(Dice.four.roll()) on a \(Dice.four.rawValue)-sided dice!"
            //                    }
            //                    Spacer()
            //                    Button("\(Dice.six.rawValue)-sided") {
            //                        resultMessage = "You rolled a \(Dice.six.roll()) on a \(Dice.six.rawValue)-sided dice!"
            //                    }
            //                    Spacer()
            //                    Button("\(Dice.eight.rawValue)-sided") {
            //                        resultMessage = "You rolled a \(Dice.eight.roll()) on a \(Dice.eight.rawValue)-sided dice!"
            //                    }
            //
            //                }
            //
            //                HStack {
            //
            //                    Button("\(Dice.ten.rawValue)-sided") {
            //                        resultMessage = "You rolled a \(Dice.ten.roll()) on a \(Dice.ten.rawValue)-sided dice!"
            //                    }
            //
            //                    Spacer()
            //                    Button("\(Dice.twelve.rawValue)-sided") {
            //                        resultMessage = "You rolled a \(Dice.twelve.roll()) on a \(Dice.twelve.rawValue)-sided dice!"
            //                    }
            //                    Spacer()
            //                    Button("\(Dice.twenty.rawValue)-sided") {
            //                        resultMessage = "You rolled a \(Dice.twenty.roll()) on a \(Dice.twenty.rawValue)-sided dice!"
            //                    }
            //                }
            //
            //                Button("\(Dice.hundered.rawValue)-sided") {
            //                    resultMessage = "You rolled a \(Dice.hundered.roll()) on a \(Dice.hundered.rawValue)-sided dice!"
            //                }
            //
            //
            //            }
            
            //                .buttonStyle(.borderedProminent)
            //                .tint(.red)
            //                .padding()
            
            
        }//VStack
        .padding()
        
    }
    
}

#Preview {
    ContentView()
}



