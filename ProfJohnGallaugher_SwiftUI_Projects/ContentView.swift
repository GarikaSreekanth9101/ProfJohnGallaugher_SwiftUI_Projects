//
//  ContentView.swift
//  ProfJohnGallaugher_SwiftUI_Projects
//
//  Created by Suja Associates on 29/07/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var enteredText: String = ""
    @State private var staticCoderNameIs: String = ""
    @State private var wuTangName: String = ""
    @State private var imageName: String = "wu-tang"
    @FocusState private var iSFocused: Bool
    
    private var firstColumn: [String] = ["Algorithmic",
                                                "Byte",
                                                "Cache",
                                                "Debug",
                                                "Echo",
                                                "Function",
                                                "Git",
                                                "Hex",
                                                "Infinite",
                                                "Java",
                                                "Kernel",
                                                "Logic",
                                                "Module",
                                                "Node",
                                                "Object",
                                                "Pixel",
                                                "Query",
                                                "Runtime",
                                                "Script",
                                                "Token",
                                                "Undefined",
                                                "Virtual",
                                                "Web",
                                                "Xcode",
                                                "Yota",
                                                "Zero"
    ]
    private var secondColumn: [String] = ["$tack",
                                                 "Processor",
                                                 "Cipher",
                                                 "Daemon",
                                                 "EndPoint",
                                                 "Framework",
                                                 "Gateway",
                                                 "Hub",
                                                 "Interrupt",
                                                 "Crash",
                                                 "Loop",
                                                 "Module",
                                                 "Nexus",
                                                 "Optimizer",
                                                 "Protocol",
                                                 "Queue",
                                                 "Router",
                                                 "Stack",
                                                 "Thread",
                                                 "Update",
                                                 "Variable",
                                                 "Widget",
                                                 "Terminal",
                                                 "Yield",
                                                 "Zen",
                                                 "Ace",
                                                 "Breakpoint",
                                                 "Root",
                                                 "Instance",
                                                 "Access",
                                                 "Archive",
                                                 "Control",
                                                 "Justice"
    ]
    
    var body: some View {
        
        VStack{
            
            
            Text("Wu-Tang\nCoder Name Genarator")
                .multilineTextAlignment(.center)
                .font(.title)
                .fontWeight(.black)
                .foregroundStyle(.yellow)
                .minimumScaleFactor(0.5)
                .frame(maxWidth: .infinity)
                .padding(.bottom)
                .background(.black)
            
            Spacer()
            
            TextField("Enter Name Here", text: $enteredText)
                .textFieldStyle(.roundedBorder)
                .font(.title2)
                .overlay{
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray, lineWidth: 1)
                    
                }
                .focused($iSFocused)
                .onChange(of: iSFocused) {
                    //isFocus changes when keyboard toggles
                    if iSFocused == true{
                        //keyboard shows
                        imageName = ""
                        enteredText = ""
                        staticCoderNameIs = ""
                        wuTangName = ""
                    }
                }
                .padding()
            
            Button{
                //TODO: Button Action
                wuTangName = getWuTangName(name: enteredText)
                iSFocused = false
                staticCoderNameIs = "Your Wu-Tang Coder Name is:"
                imageName = "wu-tang"
            } label: {
                Image("wu-tang-button")
                Text("Get It!")
            }
            .buttonStyle(.borderedProminent)
            .tint(.black)
            .font(.title2)
            .fontWeight(.bold)
            .foregroundStyle(.yellow)
            .disabled(enteredText.isEmpty)
            
            VStack{
                Text(staticCoderNameIs)
                Text(wuTangName)
                    .fontWeight(.black)
            }
            .font(.largeTitle)
            .minimumScaleFactor(0.5)
            .frame(height: 130.0)
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
            
        }//VStack
        
    }
    
    //MARK: Get Image Names
    func getWuTangName(name: String) -> String {
       
        var localName = name
        let firstLetter = localName.removeFirst()
        print("First Letter = \(firstLetter)")
        var firstColumnIndex = 0
        
        for i in 0..<firstColumn.count{
            
            if firstColumn[i].first == firstLetter{
                firstColumnIndex = i == 0 ? 25 : i-1
            }
        }
        
        return "\(firstColumn[firstColumnIndex]) \(secondColumn.randomElement()!)"
    }
    
 
    
}

#Preview {
    ContentView()
}
