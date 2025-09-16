//
//  DetailView.swift
//  ProfJohnGallaugher_SwiftUI_Projects
//
//  Created by Suja Associates on 11/09/25.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State var toDo: ToDo
    @State var item: String = ""
    @State private var reminderIsOn: Bool = false
    
    @State var notes: String = ""
    @State private var isCompleted: Bool = false
    //    @State private var dueDate: Date = Date.now + 60*60*24
    @State private var dueDate: Date = Calendar.current.date(byAdding: .day, value: 1, to: Date.now)!
    
    
    
    var body: some View {
        
        List{
            
            TextField("Enter To Do Here", text: $item)
                .font(.title)
                .textFieldStyle(.roundedBorder)
                .padding(.vertical)
                .listRowSeparator(.hidden)
            
            Toggle("Set Reminder", isOn: $reminderIsOn)
                .padding(.top)
                .listRowSeparator(.hidden)
            DatePicker("Date", selection: $dueDate)
                .listRowSeparator(.hidden)
                .padding(.bottom)
                .disabled(!reminderIsOn)
            
            Text("Notes: ")
                .padding(.top)
            TextField("Notes", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .listRowSeparator(.hidden)
            Toggle("Completed", isOn: $isCompleted)
                .padding(.top)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .onAppear(){
            item = toDo.item
            notes = toDo.notes
            dueDate = toDo.dueDate
            reminderIsOn = toDo.reminderIsOn
            isCompleted = toDo.isCompleted
            
        }
        .navigationBarBackButtonHidden()
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    //TODO: Add Save Code Here
                    //Move Data from local vars to ToDo Object
                    toDo.item = item
                    toDo.notes = notes
                    toDo.dueDate = dueDate
                    toDo.reminderIsOn = reminderIsOn
                    toDo.isCompleted = isCompleted
                    modelContext.insert(toDo)
                    guard let _ = try? modelContext.save() else {
                        print("😡 ERROR: Failed to save Data!")
                        return
                    }
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        DetailView(toDo: ToDo())
            .modelContainer(for: ToDo.self, inMemory: true)
    }
}
