//
//  FizzBuzz.swift
//  ProfJohnGallaugher_SwiftUI_Projects
//
//  Created by Suja Associates on 18/08/25.
//

import SwiftUI

struct FizzBuzz: View {
    
    
    var body: some View {
        
        VStack{
            Spacer()
            //            ForEach(1...100, id: \.self) { number in
            //                if number % 3 == 0 && number % 5 == 0 {
            //                    Text("FizzBuzz")
            //                        .padding()
            //                } else if number % 3 == 0 {
            //                    Text("Fizz")
            //                } else if number % 5 == 0 {
            //                    Text("Buzz")
            //                } else {
            //                    Text("\(number)")
            //                }
            //            }
            
            ForEach(1...100, id: \.self) { number in
                let tuple = (number%3, number%5)
                
                switch tuple{
                case (0, 0):
                    Text("FizzBuzz")
                case (_, 0):
                    Text("Buzz")
                case (0, _):
                    Text("Fizz")
                default:
                    Text("\(number)")
                }
            }
            
            Spacer()
        }
        .padding()
    }
}


#Preview {
    FizzBuzz()
}
