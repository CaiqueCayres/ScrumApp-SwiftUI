//
//  ContentView.swift
//  ScrumApp
//
//  Created by Caique on 24/01/24.
//

import SwiftUI
import SwiftData

struct MeetingView: View {
    
    var body: some View {
        
        VStack {
            ProgressView(value: 10, total: 15)
            
            HStack {
                
                VStack(alignment: .leading) {
                    
                    Text("Seconds elapsed")
                        .font(.caption)
                    
                    Label("300",
                          systemImage: "hourglass.bottomhalf.fill")
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    
                    Text("Seconds Remaining")
                        .font(.caption)
                    
                    Label("600",
                          systemImage: "hourglass.bottomhalf.fill")
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time remaining")
            .accessibilityValue("10 minutes")
            
            Circle()
                .strokeBorder(lineWidth: 24)
            
            HStack {
                Text("Speaker 1 of 3")
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image(systemName: "forward.fill")
                }
            }
            .accessibilityLabel("Next Speaker")
        }
        .padding()
    }
}

#Preview {
    MeetingView()
}
