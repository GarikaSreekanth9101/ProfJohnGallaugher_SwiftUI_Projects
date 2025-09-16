//
//  ToDo.swift
//  ProfJohnGallaugher_SwiftUI_Projects
//
//  Created by Suja Associates on 15/09/25.
//

import Foundation
import SwiftData

@MainActor
@Model
class ToDo {
    
    var item: String = ""
    var reminderIsOn: Bool = false
    var notes: String = ""
    var isCompleted: Bool = false
    var dueDate: Date = Date.now + 60*60*24
    
    
    init(item: String = "", reminderIsOn: Bool = false, notes: String = "", isCompleted: Bool = false, dueDate:Date = Date.now + 60*60*24) {
        self.item = item
        self.reminderIsOn = reminderIsOn
        self.notes = notes
        self.isCompleted = isCompleted
        self.dueDate = dueDate
    }

}


extension ToDo {
    
    static var preview: ModelContainer{
        
        let container = try! ModelContainer(for: ToDo.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        //Add Mock Data
        container.mainContext.insert(ToDo(item: "Create Swift Data Lessions", reminderIsOn: true, notes: "Now with iOS 16 and xcode 18", isCompleted: false, dueDate: Date.now + 60*60*10))
        
        container.mainContext.insert(ToDo(item: "Montenegrin Educator Talk", reminderIsOn: true, notes: "They want to learn abot entrepreneurship", isCompleted: false, dueDate: Date.now + 60*60*18))
        container.mainContext.insert(ToDo(item: "Post flyers for Swift in Santiago", reminderIsOn: true, notes: "To be held at UAH in Chile", isCompleted: false, dueDate: Date.now + 60*60*16))
        container.mainContext.insert(ToDo(item: "Prepare old iPhone for Lily", reminderIsOn: true, notes: "She gets my old Pro", isCompleted: false, dueDate: Date.now + 60*60*24))
        return container
    }

}
