//
//  ProfJohnGallaugher_SwiftUI_ProjectsApp.swift
//  ProfJohnGallaugher_SwiftUI_Projects
//
//  Created by Suja Associates on 29/07/25.
//

import SwiftUI
import SwiftData

@main
struct ProfJohnGallaugher_SwiftUI_ProjectsApp: App {
    var body: some Scene {
        WindowGroup {
            SnackListView()
                .modelContainer(for: Snack.self) //Set's up the 'container' or Database Structure - it will hold snack types
        }
    }
    
    //print out the application path where our simulator data can be found - if browsing with DB Browser
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
