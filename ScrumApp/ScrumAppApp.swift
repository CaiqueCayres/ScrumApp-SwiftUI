//
//  ScrumAppApp.swift
//  ScrumApp
//
//  Created by Caique on 24/01/24.
//

import SwiftUI
import SwiftData

@main
struct ScrumAppApp: App {
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    @State private var scrums = DailyScrum.sampleData

    var body: some Scene {
        
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
        .modelContainer(sharedModelContainer)
    }
}
