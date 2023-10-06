//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Aaron Brown on 10/5/23.
//

import SwiftUI

@main
struct BookwormApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            //Injecting DataController into environment's view context (let us work with the data in memory.)
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
