//
//  ContentView.swift
//  ProfJohnGallaugher_SwiftUI_Projects
//
//  Created by Suja Associates on 29/07/25.
//

import SwiftUI
import SwiftData

enum SortOptions: String, CaseIterable {
    
    case asEntered = "As Entered"
    case alphabetical = "A-Z"
    case chronological = "Date"
    case completed = "Not Done"
}


struct SortedToDoListView: View {
    
    @Query var toDos: [ToDo]
    @Environment(\.modelContext) private var modelContext
    let sortedSelection: SortOptions
    
    init(sortedSelection: SortOptions) {
      
        self.sortedSelection = sortedSelection
        switch self.sortedSelection {
        case .asEntered:
            _toDos = Query()
        case .alphabetical:
            _toDos = Query(sort: \.item)
        case .chronological:
            _toDos = Query(sort: \.dueDate)
        case .completed:
            _toDos = Query(filter: #Predicate {$0.isCompleted == false})
        }
    }

    var body: some View {
        
        List{
            
            ForEach(toDos, id: \.self) { toDo in
                
                VStack(alignment: .leading) {
                    HStack {
                        
                        Image(systemName: toDo.isCompleted ? "checkmark.rectangle" : "rectangle")
                            .onTapGesture {
                                toDo.isCompleted.toggle()
                                guard let _ = try? modelContext.save() else{
                                    print("😡 ERROR:  save contect after Toggle on ToDo list view did not work")
                                    return
                                }
                                
                            }
                        
                        NavigationLink {
                            DetailView(toDo: toDo)
                        } label: {
                            Text(toDo.item)
                        }
                        .font(.title2)
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                modelContext.delete(toDo)
                                guard let _ = try? modelContext.save() else{
                                    print("😡 ERROR: Failed to save contect after deleting ToDo")
                                    return
                                }
                            }
                        }
                    }
                    HStack {
                    
                        Text(toDo.dueDate.formatted(date: .abbreviated, time: .shortened))
                            .foregroundStyle(.secondary)
                        if toDo.reminderIsOn {
                            Image(systemName: "calendar.badge.clock")
                                .symbolRenderingMode(.multicolor)
                        }
                    }
                    
                }
                
            }
            //                .onDelete { indexSet in
            //                    indexSet.forEach({modelContext.delete(toDos[$0])})
            //                    guard let _ = try? modelContext.save() else{
            //                        print("😡 ERROR: Failed to save contect after deleting ToDo")
            //                        return
            //                    }
            //                }
        }
        .listStyle(.plain)
    }
    
}

struct ToDoListView: View {
    

    @State private var isSheetPresented: Bool = false
    @State private var sortSelection: SortOptions = .asEntered
    
    var body: some View {
        
        NavigationStack{
            
            SortedToDoListView(sortedSelection: sortSelection)
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .sheet(isPresented: $isSheetPresented) {
                NavigationStack{
                    DetailView(toDo: ToDo())
                }
            }
            .toolbar{
                
                ToolbarItem(placement: .topBarTrailing) {
                    
                    Button {
                        //TODO: Add To Do Item Code Here
                        isSheetPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }//Top Toolbar
                
                ToolbarItem(placement: .bottomBar) {
                    Picker("", selection: $sortSelection) {
                        ForEach(SortOptions.allCases, id: \.self) { sortOrder in
                            Text(sortOrder.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                }//Bottom Toolbar
                
            }//toolbar
        }//Navigation Stack
    }
}

#Preview {
    ToDoListView()
        .modelContainer(ToDo.preview)
}



