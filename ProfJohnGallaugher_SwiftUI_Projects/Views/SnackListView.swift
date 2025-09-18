//
//  ContentView.swift
//  ProfJohnGallaugher_SwiftUI_Projects
//
//  Created by Suja Associates on 29/07/25.
//

import SwiftUI
import SwiftData


struct SnackListView: View {
    
    @Query var snacks: [Snack]
    @Environment(\.modelContext) private var modelContext //for holding temporary data before saving
    @State private var isSheetPresented: Bool = false
    
    var body: some View {
        
        NavigationStack{
            
            List{
                
                ForEach(snacks) { snack in
                    
                    NavigationLink {
                        SnackDetailView(snack: snack)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(snack.name)
                                .font(.title)
                                .lineLimit(1)
                            
                            HStack{
                                Text("Qty: \(snack.onHand)")
                                Text(snack.notes)
                                    .italic()
                                    .lineLimit(1)
                                    .foregroundStyle(.secondary)
                            }
                            .font(.body)
                        }
                        
                    }
                    .swipeActions {
                        Button("Delete", role: .destructive) {
                            modelContext.delete(snack)
                            guard let _ = try? modelContext.save() else{
                                print("😡 ERROR: Seipe Delete didn't work ")
                                return
                            }
                        }
                    }
                    
                }//ForEach
            }//List
            .listStyle(.plain)
            .navigationTitle("Snacks on Hand:")
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isSheetPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    //                    .buttonStyle(.borderedProminent)
                    //                    .tint(.green)
                }
            }
            .sheet(isPresented: $isSheetPresented) {
                NavigationStack{
                    SnackDetailView(snack: Snack())
                }
            }
        }//Navigation Stack
    }//Navigation Stack
}

#Preview {
    SnackListView()
        .modelContainer(Snack.preview) //Show Mock data in preview
}



