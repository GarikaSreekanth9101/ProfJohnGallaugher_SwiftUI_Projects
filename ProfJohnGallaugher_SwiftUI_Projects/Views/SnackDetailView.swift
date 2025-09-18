//
//  DetailView.swift
//  ProfJohnGallaugher_SwiftUI_Projects
//
//  Created by Suja Associates on 11/09/25.
//

import SwiftUI

enum ComfortLevel: Int, CaseIterable {
    case doesTheJob = 1, solid, cravingSatisfyer, gourmet, emergencyComfort
    
    var label: String{
        switch self {
        case .doesTheJob: return "1 - ✅ Does the job"
        case .solid: return "2 - 👍 Solid"
        case .cravingSatisfyer: return "3 - 🤤 Craving met"
        case .gourmet: return "4 - 🧑‍🍳 Gourmet"
        case .emergencyComfort: return "5 - 🚨 Emergency"
        }
    }
}

struct SnackDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @State var snack: Snack //Passed from SnackListView
    
    @State private var name: String = ""
    @State private var onHand: Int = 0
    @State private var notes: String = ""
    @State private var selectedComfortLevel: Int = 0
    
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            TextField("Snack Name", text: $name)
                .font(.largeTitle)
                .textFieldStyle(.roundedBorder)
            HStack{
                Text("Qty: ")
                    .bold()
                Spacer()
                Text("\(onHand)")
                Stepper("", value: $onHand, in: 0...Int.max)
                    .labelsHidden()
            }
            .padding(.bottom)
            HStack{
                Text("Comfort Level:")
                    .bold()
                Spacer()
                Picker("", selection: $selectedComfortLevel) {
                    ForEach(ComfortLevel.allCases, id: \.self) { comfortLevel in
                        
                        Text(comfortLevel.label)
                            .tag(comfortLevel.rawValue)
                    }
                }
            }
            Text("Notes:")
                .bold()
            TextField("Notes", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
            Spacer()
        }
        .padding(.horizontal)
        .font(.title2)
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
//                .buttonStyle(.borderedProminent)
//                .tint(.red)
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                   snack.name = name
                    snack.onHand = onHand
                    snack.notes = notes
                    snack.comfortLevel = selectedComfortLevel
                    modelContext.insert(snack) //will add new or update existing
                    guard let _ = try? modelContext.save() else{
                        print("😡 ERROR: modelContext.save didn't work in SnackDetailView")
                        return
                    } //only need for simulator - forces save so you can browse with DB Broswer
                    dismiss()
                }
//                .buttonStyle(.borderedProminent)
//                .tint(.mint)
            }

        }
        .onAppear(){
            name = snack.name
            onHand = snack.onHand
            notes = snack.notes
            selectedComfortLevel = snack.comfortLevel
        
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    NavigationStack{
        SnackDetailView(snack: Snack(
            name: "Lil Swifties",
            onHand: 3,
            notes: "Home made coockies bake by prof. G. He will bring these for Lunar New Year.",
            comfortLevel: 5
        ))
    }
}
