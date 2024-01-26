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
    
    @StateObject private var store = ScrumStore()
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some Scene {
        
        WindowGroup {
            
            ScrumsView(scrums: $store.scrums) {
                
                Task {
                    
                    do {
                        
                        try await store.save(scrums: store.scrums)
                        
                    } catch {
                        
                        errorWrapper = ErrorWrapper(error: error,
                                                    guidance: "Try again later.")
                        
                    }
                }
            }
            .task {
                
                do {
                    
                    try await store.load()
                    
                } catch {
                    
                    errorWrapper = ErrorWrapper(error: error,
                                                guidance: "Scrumdinger will load sample data and continue.")
                    
                }
            }
            .sheet(item: $errorWrapper) {
                
                store.scrums = DailyScrum.sampleData
                
            } content: { wrapper in
                
                ErrorView(errorWrapper: wrapper)
                
            }
        }
        .modelContainer(sharedModelContainer)
    }
}
