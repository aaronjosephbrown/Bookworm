//
//  dataController.swift
//  Bookworm
//
//  Created by Aaron Brown on 10/5/23.
//

import CoreData
import Foundation


class DataController: ObservableObject {
    // Loading CoreData Bookworm.xcdatamodeld -- see BookwormApp.swift for next step
    let container = NSPersistentContainer(name: "Bookworm")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load \(error.localizedDescription)")
            }
        }
    }
}
