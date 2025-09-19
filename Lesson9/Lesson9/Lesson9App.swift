//
//  Lesson9App.swift
//  Lesson9
//
//  Created by Batuhan Gözegü on 19.09.2025.
//

import SwiftUI

@main
struct Lesson9App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
