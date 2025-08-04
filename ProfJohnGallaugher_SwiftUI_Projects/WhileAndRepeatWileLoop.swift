//
//  WhileAndRepeatWileLoop.swift
//  ProfJohnGallaugher_SwiftUI_Projects
//
//  Created by Suja Associates on 04/08/25.
//

import SwiftUI

struct WhileAndRepeatWileLoop: View {
    
  
    @State private var rollCount: Int = 0
    @State private var message: String = ""

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
       
            Button("Show Message"){
                
                // MARK: While Loop
                //var diceRoll: Int.random(in: 1...6)
//                print("Dice Roll #\(rollCount) = \(diceRoll)")
                
//                while diceRoll != 6{
//                    diceRoll = Int.random(in: 1...6)
//                    rollCount += 1
//                    print("Dice Roll #\(rollCount) = \(diceRoll)")
//                }
//                print("It took \(rollCount) rolls to Roll a Six")
                // MARK: Repeat While Loop
                var diceRoll: Int
                repeat{
                    diceRoll = Int.random(in: 1...6)
                    rollCount += 1
                    message = "Dice Roll #\(rollCount) = \(diceRoll)"
                }while diceRoll != 6
                message = "It took \(rollCount) rolls to Roll a Six"

            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
        
    }
}

#Preview {
    WhileAndRepeatWileLoop()
}
