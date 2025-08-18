//
//  TwoWayBindings.swift
//  ProfJohnGallaugher_SwiftUI_Projects
//
//  Created by Suja Associates on 07/08/25.
//

import SwiftUI

struct TwoWayBindings: View {
    
    @State private var count: Int = 0
    @State private var toggleIsOn: Bool = true
    @State private var name: String = ""
    @State private var selectedColor: Color = .red
    @State private var selectedDate: Date = Date()
    @State private var stepperValue: Int = 0
    
    var body: some View {
        
        VStack{
            
            Spacer()
            
            Text("Press Me: \(count)")
            Button("Press Me"){
                count += 1
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
            //Text Field
            TextField("Enter a name", text: $name)
                .textFieldStyle(.roundedBorder)
            Text("Name Entered: \(name)")
            
            Spacer()
            //Switch Buttom
            Toggle("Toggle is \(toggleIsOn ? "On" : "Off")", isOn: $toggleIsOn)
            Spacer()
            Rectangle()
                .fill(selectedColor)
                .frame(width: 100, height: 100)
                .padding()
            //Color Picker
            ColorPicker("Pick a rectangle color", selection: $selectedColor)
            Spacer()
            //Date Picker
            DatePicker("Date:", selection: $selectedDate)
            Text("Selected Date is \(selectedDate.formatted(date: .abbreviated, time: .shortened))")
            Spacer()
            //Stepper
            Stepper("Stepper Value: \(stepperValue)", value: $stepperValue, in: 0...10)
//            Stepper("Stepper Value: \(stepperValue)", value: $stepperValue)
            
            Spacer()
            
        }
        .font(.title2)
        .padding()
    }
    
}

#Preview {
    TwoWayBindings()
}
