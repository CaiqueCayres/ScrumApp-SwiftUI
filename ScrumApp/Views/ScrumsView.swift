//
//  ScrumsView.swift
//  ScrumApp
//
//  Created by Caique on 24/01/24.
//

import SwiftUI

struct ScrumsView: View {
    
    @Environment(\.scenePhase) var scenePhase
    
    @Binding var scrums: [DailyScrum]
    @State private var isPresentingNewScrumView = false
    
    let saveAction: () -> Void
    
    var body: some View {
        
        NavigationStack {
            
            List($scrums) { $scrum in
                
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    
                    CardView(scrum: scrum)
                    
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                
                Button(action: {
                    isPresentingNewScrumView = true
                }) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
        .sheet(isPresented: $isPresentingNewScrumView) {
            NewScrumView(scrums: $scrums,
                         isPresentingNewScrumView: $isPresentingNewScrumView)
        }
        .onChange(of: scenePhase) { phase in
            
            if phase == .inactive {
                saveAction()
            }
            
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    
    static var previews: some View {
        ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
    }
}
